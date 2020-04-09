STR_EXPRESSION = '2222 - 222 + 22 / 2 - 2'.freeze

def print_evaluation
  puts "#{evaluate_expression} = #{STR_EXPRESSION}"
  print "It consists #{calculate_twos} twos"
end

def evaluate_expression
  2222 - 222 + 22 / 2 - 2
end

def calculate_twos
  STR_EXPRESSION.count '2'
end

print_evaluation
