=begin
lineWidth = 20
puts "Table of Contents".center(lineWidth)
puts "Chapter 1: Numbers".ljust(lineWidth) + "Page 1".rjust(lineWidth)
puts "Chapter 2: Strings".ljust(lineWidth) + "Page 2".rjust(lineWidth)
=end

chapter1 = ["Chapter 1: Numbers","Page 1"]
chapter2 = ["Chapter 2: Strings", "Page 2"]

tableOfContents = [chapter1, chapter2]

lineWidth = 20
puts "Table of Contents".center(lineWidth)
tableOfContents.each do |chapter|
  chapter.each do |items|
    print items.ljust(lineWidth) + "".rjust(lineWidth)
  end
  puts ""
end
