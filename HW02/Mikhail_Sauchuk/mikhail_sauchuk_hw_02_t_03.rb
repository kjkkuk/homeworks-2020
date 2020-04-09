# frozen_string_literal: true

# Task 03 should return a string containing the duration of the action in SEC
# between events that occurred at the time of Calling core with action:
# - Between them can be any number of other events.
# - For this example, the output will be:
# (2018-04-23 17:18:38.8 - 2018-04-23 17:17:49.7) = (38.8 + 10.3) = "49.1"

# 2018-04-23 17:18:59.8

require 'date'

LOG_FILE = 'debug.log'
SEARCH_PATTERN = 'Calling core with action:'
DATETIME_PATTERN = '\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d+'

def main
  puts 'Please enter the full path to log file you would like to chekc or ' \
    'press Enter to test the code'
  user_input = gets.chomp
  file_name = check_input(user_input)
  locking_messages = find_post_messages(file_name, SEARCH_PATTERN)
  calc_time(locking_messages)
end

def find_post_messages(file_name, search_pattern)
  # method get all "Calling core" messages from the log
  # add return only datetime from these lines
  lines = File.readlines(file_name)
  calling_lines = lines.select { |line| line =~ /#{search_pattern}/ }\
                       .map { |line| line.match(DATETIME_PATTERN).to_s }
  calling_lines
end

def convert_time(time)
  # method return absolute time in SEC starting from 1970-01-01
  DateTime.strptime(time, '%Y-%m-%d %H:%M:%S.%L').to_time.to_f
end

def calc_time(arr_time)
  # method calculate time between two "Calling core" actions
  (0..arr_time.size - 2).each do |i|
    time_delta = convert_time(arr_time[i + 1]) - convert_time(arr_time[i])
    puts "(#{arr_time[i + 1]} - #{arr_time[i]}) = "\
                                                    "\"#{time_delta.round(1)}\""
  end
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
