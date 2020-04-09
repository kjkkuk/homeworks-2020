loop do
  print 'Please, enter hours: '
  hours = gets.chomp.to_f

  print 'Please, enter minutes: '
  minutes = gets.chomp.to_f

  def angle_amount(hours, minutes)
    minutes_angles = 360 / 60 * minutes
    hours_angles = (hours + minutes / 60) * 30
    (hours_angles - minutes_angles).abs
  end

  angle = angle_amount(hours, minutes)
  puts "Angle: #{angle}"

  print 'Do You want to try again?(yes/no): '
  break if gets.chomp.downcase == 'no'
end
