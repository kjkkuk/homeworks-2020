hours = gets.to_i
minutes = gets.to_i
# this method turns the time into an angle between the watch strips
def calc_angle(hours, minutes)
  angel = (minutes * 6 - (hours * 60 + minutes) * 0.5).abs
  if angel > 180
    360 - angel.abs
  else
    angel.abs
  end
end

puts "#{calc_angle(hours, minutes)} degrees"
