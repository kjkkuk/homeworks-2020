puts 'Welcome to my first program!'
print 'Type hours'
h = gets.chomp.to_i
print 'Type minutes'
m = gets.chomp.to_i
puts 'Awesome! Let me work hard instead of you!'
puts "The angle is #{(30 * h - 5.5 * m).abs} degrees"
