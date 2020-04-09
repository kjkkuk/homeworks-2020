def calculate_angle(hours, minutes)
  (hours * 30 - minutes * 5.5).abs
end

puts calculate_angle(3, 15)
puts calculate_angle(3, 20)
puts calculate_angle(7, 15)
