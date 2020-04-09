def calculate_angle(hours, minutes)
  # one hour = 360/12 = 30 degrees
  hours_angle = hours * 30 + minutes * 0.5
  # one minute = 360/60 = 6 degrees
  minutes_angle = 6 * minutes
  result = (hours_angle - minutes_angle).abs
  puts "The angle between hours and minutes hands is #{result} degrees"
end

calculate_angle(3, 15)
