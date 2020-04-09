def parse(time)
  return 'Undefined format' unless time.match(/^\d{1,2}:\d{1,2}$/)

  hours, minutes = time.split(':').map(&:to_i)
  (minutes * 6 - (hours * 30 + minutes * 0.5)).abs
end

puts 'Hi, enter the time! (XX:XX)'
puts parse(gets.strip)
