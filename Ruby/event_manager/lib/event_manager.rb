require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'date'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def clean_phone_numbers(phone_number)#012-456-8901
  result = phone_number.tr('^0-9','').to_s
  if result.length < 10
    return "Bad Number"
  elsif result.length == 11
    if result[0] == 1
      result = result[1..10]
    else
      return "Bad Number"
    end
  elsif result.length > 10
    return "Bad Number"
  end
  result.insert(6,"-")
  result.insert(3,"-")
  return result
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    legislators = civic_info.representative_info_by_address(
                                address: zip,
                                levels: 'country',
                                roles: ['legislatorUpperBody', 'legislatorLowerBody']
                  ).officials
  rescue
    "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
  end
end

def save_thank_you_letters(id,form_letter)
  Dir.mkdir("output").unless Dir.exists? "output"
  filename =  "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    File.puts form_letter
  end

end

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

regHour = {}
regDay = {}


contents.each do |row|
  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  phone_number = clean_phone_numbers(row[:homephone])

  legislators = legislators_by_zipcode(zipcode)

  timeOfDay = DateTime.strptime(row[:regdate].to_s, '%m/%d/%y %H:%M')

  if regHour[timeOfDay.hour].nil?
    regHour[timeOfDay.hour] = 1
  else
    regHour[timeOfDay.hour] = regHour[timeOfDay.hour] + 1
  end

  if regDay[timeOfDay.wday].nil?
    regDay[timeOfDay.wday] = 1
  else
    regDay[timeOfDay.wday] = regDay[timeOfDay.wday] + 1
  end

  form_letter = erb_template.result(binding)


  #save_thank_you_letters(id,form_letter)
end

regHour = regHour.sort_by{|time, count| count}.to_h
puts regHour
regDay = regDay.sort_by{|day,count| count}.to_h
puts regDay
