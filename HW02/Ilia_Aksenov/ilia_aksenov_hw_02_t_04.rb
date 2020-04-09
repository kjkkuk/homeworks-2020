require 'time'

def task_4(str)
  { letters: str.scan(/[a-z]/).size, digits: str.scan(/\d/).size }
end

puts 'This script can find errors in log file. Please, enter filepath: '
puts task_4(gets.strip)
