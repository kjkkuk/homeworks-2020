# frozen_string_literal: true

# read txt file as array
lines = File.readlines('input_hw_02_t_01.txt', chomp: true)

# select line with error
def find_errors(lines)
  lines.find { |line| line.downcase.include? 'error' }
end

puts find_errors(lines)
