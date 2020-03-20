puts "Enter hours:"
hours = gets.to_i

puts "Enter minutes:"
minutes = gets.to_i

deg = (minutes * 6 - (hours * 60 + minutes) * 0.5).abs

puts "#{deg} deg"
