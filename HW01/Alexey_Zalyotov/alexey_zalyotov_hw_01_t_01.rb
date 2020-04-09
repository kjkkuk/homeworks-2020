puts 'Hello, friend!'
puts 'This program calculate angle between the hours and the minutes hands.'
puts
print 'How many hours does the hour hand show? '
# Know the hour
hours = gets.to_i

print 'How many minutes does the minute hand show? '
# Know the minutes
minutes = gets.to_i

# Define method, that calculate the angle
def check_angle(hours, minutes)
  (minutes * 6 - (hours * 30 + minutes * 0.5)).abs
end

puts "#{check_angle(hours, minutes)} degrees"
