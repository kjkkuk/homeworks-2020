# Method task_2 should return:
# [X] an array of formatted strings containing information about post requests;
# * for the example above, the result should be:
# [
#   "23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES",
#   "23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN",
#   "23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES"
# ]
# [X] lines that do not match the format should be ignored
# [X] if there is no suitable string at the input,
#   the method should return an empty array
# [X] Rubocop check
# IP_format -- [DATE_format] "MESSAGE_format" ...
# "DATE_format FROM: IP_format TO: MESSAGE_format"

class Task2
  IP_FORMAT = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/.freeze
  DATE_FORMAT = %r{\d{1,2}/\w+/\d{4}:\d{2}:\d{2}:\d{2} \+\d{1,4}}.freeze
  MESSAGE_FORMAT = %r{(?<= "POST )(.+)(?= HTTP/1.1)}.freeze
  LOG_FORMAT =
    "#{IP_FORMAT} - - " \
    "\\[#{DATE_FORMAT}\\] " \
    "\\\"POST #{MESSAGE_FORMAT} \\HTTP/1.1\".*".freeze

  def initialize(file_name)
    @file_name = file_name
    @valid_line_arr = []
  end

  def task_2
    check_file_name? ? parse_log_file : puts('File not found!')
    valid_line_arr.empty? ? valid_line_arr : puts(valid_line_arr)
  end

  private

  attr_reader :file_name, :valid_line_arr

  def check_file_name?
    File.exist?(file_name) ? true : false
  end

  def parse_log_file
    File.foreach(file_name) do |line|
      valid_line_arr << parse_line(line) if format_match?(line)
    end
  end

  def parse_line(line)
    ip = line.match(IP_FORMAT)
    date = line.match(DATE_FORMAT)
    message = line.match(MESSAGE_FORMAT).to_s.capitalize
    "#{date} FROM: #{ip} TO: #{message}"
  end

  def format_match?(line)
    line.match?(LOG_FORMAT)
  end
end

Task2.new('data_test_with_errors.log').task_2
