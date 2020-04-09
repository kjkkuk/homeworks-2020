# Get the number 2009 using arithmetic and eleven twos

equation = '2 + 222 * 22222 / 22'
repeated_numbers = equation.scan('2').size

puts "2009 == #{equation} is " + (2222 - 222 + 22 / 2 - 2 == 2009).to_s
puts "and we use #{repeated_numbers} '2' in the equation"
