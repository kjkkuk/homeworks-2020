# enter hours
puts 'Enter hours:'
hours = gets.to_i

# enter minutes
puts 'Enter minutes:'
minutes = gets.to_i

# algoritthm of decision task
deg = (minutes * 6 - (hours * 60 + minutes) * 0.5).abs

# output of task
puts "#{deg} deg"
