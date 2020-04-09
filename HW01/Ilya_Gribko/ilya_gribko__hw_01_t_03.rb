# 3. Get the number 2009 using arithmetic and eleven twos
# | Output example: 2912 == 2 + 222 * 22222 / 22

def just_equation(number)
  # use 'eval' here for educational purposes only
  # # security risk
  # puts "#{number} == #{equation}" if number == eval(equation)
  puts "#{number} == 2222 - 222 + 22 / 2 - 2" if number == equation
end

def equation
  2222 - 222 + 22 / 2 - 2
end

just_equation(2009)
