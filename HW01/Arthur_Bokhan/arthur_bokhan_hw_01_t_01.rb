puts 'Put hours'
hours = gets.to_i

puts 'Put minutes'
minutes = gets.to_i

# create method with hours and minutes
def calculation(hours, minutes)
  # value of hours can't be more then 12 and less then 0
  raise "This #{hours} isn't valid!" if hours.negative? || hours > 12
  # value of minutes can't be more then 60 and less then 0
  raise "This #{minutes} isn't valid!" if minutes.negative? || minutes > 60

  # count
  actual_minutes = minutes * 6
  actual_hours = (hours * 30) + (minutes / 2.0)
  (actual_hours - actual_minutes).abs
end

result = calculation(hours, minutes)
puts "Angle is #{result}"
