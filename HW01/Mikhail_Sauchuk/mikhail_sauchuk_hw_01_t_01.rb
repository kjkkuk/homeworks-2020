# this script calculate the angle between the clock's hands

ONE_MIN_ANGLE = 360 / 60
ONE_OUR_ANGLE = ONE_MIN_ANGLE * 5

def calc_angle
  print 'Please, input hours '
  hours = clear_hours
  print 'Now, please input minutes '
  minutes = clear_minutes
  angle = (minutes * ONE_MIN_ANGLE - (hours * ONE_OUR_ANGLE + minutes / 2)).abs
  puts "The angel between hours hand #{hours.to_i} and minutes #{minutes.to_i}"\
  " is #{angle}"
end

def take_input
  gets.to_f
end

def clear_hours
  # this method take input from user and check if the input hours is valid
  # and convert hours if hours in 24-hours format
  hours = take_input
  while hours > 23
    puts 'Invalid input, please input hours beetwee 0 and 23'
    hours = take_input
  end
  hours -= 12 if hours >= 12
  hours
end

def clear_minutes
  # this method take input from user and check if the input minutes is valid
  minutes = take_input
  while minutes > 60
    puts 'Invalid input, please input mintes beetwee 0 and 60'
    minutes = take_input
  end
  minutes = 0 if minutes == 60
  minutes
end

calc_angle
