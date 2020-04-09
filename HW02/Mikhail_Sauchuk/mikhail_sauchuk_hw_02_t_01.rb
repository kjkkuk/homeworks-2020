# frozen_string_literal: true

# Method `task_1` should return:
# - full text of the first line with an error
# (the presence of the substring `error` in any case)
# - If the input is text that does not contain the word `error`,
# return an empty string

LOG_FILE = 'bash.log'

def main
  puts 'Please enter the full path to log file you would like to chekc or ' \
    'press Enter to test the code'
  user_input = gets.chomp
  log_to_check = check_input(user_input)
  find_error(log_to_check)
end

def find_error(file_name)
  # method rerturns first line with error from the input log
  lines = File.readlines(file_name)
  error_line = lines.find { |line| line.downcase.include? 'error' }
  puts "the first line with error in #{file_name} is:\n\t#{error_line}"
end

def check_input(input)
  # method chekc the user input and exit from the script in input is invalid
  if input.empty?
    LOG_FILE
  elsif File.exist? input
    input
  else
    puts 'Invalid input, please try again'
    exit
  end
end

main
