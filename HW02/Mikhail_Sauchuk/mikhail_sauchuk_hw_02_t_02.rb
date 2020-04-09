# frozen_string_literal: true

# Method `task_2` should return:
# an array of formatted strings containing information about post requests;
# for the example above, the result should be:
# lines that do not match the format:
# 10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1"
# 200 48 0.0498
# should be ignored
#
# output example:
#  "23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES",
#  "23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN",
#  "23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES"

LOG_FILE = 'bash.log'
IP_PATTERN = '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'
DATE_PATTERN = '\d{1,2}\/\w+\/\d{4}:\d{2}:\d{2}:\d{2} \+\d+'
METHOD_PATTERN = '"POST \/\w+\/\d+\/\w+ HTTP\/1.1"'

def main
  puts 'Please enter the full path to log file you would like to chekc or ' \
    'press Enter to test the code'
  user_input = gets.chomp
  file_name = check_input(user_input)
  search_pattern = "#{IP_PATTERN} - - \\[#{DATE_PATTERN}\\] #{METHOD_PATTERN}.*"
  post_messages = find_post_messages(file_name, search_pattern)
  get_info(post_messages)
end

def find_post_messages(file_name, search_pattern)
  # method get all POST messages from the log
  lines = File.readlines(file_name)
  lines.select { |line| line =~ /#{search_pattern}/ }
end

def get_info(arr_messages)
  # method take needed information from the POTS messages
  # and put it the right order to output
  arr_messages.each do |line|
    date = line.match(DATE_PATTERN)
    from = line.match(IP_PATTERN)
    message = line.match(METHOD_PATTERN)
    puts "#{date} FROM #{from} TO: #{message}"
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
