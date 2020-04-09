print 'Enter the value of the hours hand: '
hours = gets.to_i
print 'Enter the value of the minutes hand: '
minutes = gets.to_i
def angle_time(hours, minutes)
  hour_hand = 0.5 * (minutes + hours * 60)
  minutes_hand = 6 * minutes
  # The angle between the hour and minute hand
  (hour_hand - minutes_hand).abs
end

puts "The angle is #{angle_time(hours, minutes)}"
