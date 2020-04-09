# 2. What is the equation to get 24 with 1,3,4
# and 6 you can only divide, multiply or add them? + / *
# | Output example: 24 == 1 / 3 * 4 + 6

def just_equation(number)
  # use 'eval' here for educational purposes only
  # security risk
  # puts "#{number} == #{equation}" if number == eval(equation)
  puts "#{number} == 1 / 3 + 6 * 4" if number == equation
end

def equation
  1 / 3 + 6 * 4
end

just_equation(24)

### V2 NOT FOR CHECK, but one beer from me if you help me :)
# ToDo: Need refactoring
# (method is sensitive to the number of elem in the numbers_array and not DRY)

# def search_equation(number, numbers_array, actions_array)
#   numbers_array = numbers_array.permutation.to_a
#
#   numbers_array.each do |combination|
#     actions_array.each do |action|
#       n = 0
#       iter1 = iteration(combination[n],
#                         action,
#                         combination[n + 1],
#                         combination[n])
#
#       actions_array.each do |action|
#         n = 1
#         iter2 = iteration(iter1[:value],
#                           action,
#                           combination[n + 1],
#                           iter1[:string])
#
#         actions_array.each do |action|
#           n = 2
#           iter3 = iteration(iter2[:value],
#                             action,
#                             combination[n + 1],
#                             iter2[:string])
#
#           message(number, iter3[:string]) if iter3[:value] == number
#         end
#       end
#     end
#   end
# end
#
# private
#
# def iteration(value1, action, value2, str)
#   { value: (value1.send action, value2),
#     string: "#{str} #{action} #{value2}" }
# end
#
# def message(number, equation)
#   puts "#{number} == #{equation}"
# end
#
# search_equation(24, [1, 3, 4, 6], %w[+ / *])
