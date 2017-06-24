puts 1+2

hours_in_year = (365*24)
puts hours_in_year.to_s + " hours in a year"

minutes_in_decade = hours_in_year * 60 * 10
puts minutes_in_decade.to_s + " minutes in a decade"

my_age = 33.5
my_age_in_seconds = my_age * 365 * 24 * 60 * 60
puts my_age_in_seconds.to_s + " seconds old"

chocolates_per_day = 2
life_expectancy = 80
lifetime_chocolates = (chocolates_per_day * 365 * life_expectancy)
puts lifetime_chocolates.to_s + " chocolates to consume in a lifetime"

your_age_in_seconds = 1246000000.0
your_age_in_years = your_age_in_seconds / 60 / 60 / 24 / 365
puts your_age_in_years.to_s + " years old"
