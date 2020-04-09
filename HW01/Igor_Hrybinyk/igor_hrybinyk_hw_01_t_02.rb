# 2. What is the equation to get 24 with 1,3,4 and 6
# you can only divide, multiply or add them?

def get_number(result)
  # This is not mathematical correct, because we cant subtract
  puts "Well done, #{result} == 24" if 1 / 3 + 4 * 6 == result
  # But, if we can, here is solution: 6.0 / (1.0 - 3.0 / 4.0)
end

get_number(24)
