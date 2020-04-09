# The task_3 method should return a string containing the duration of the action
# in SECONDS between events that occurred at the time
# of Calling core with action:
# * Between them can be any number of other events.
# * For this example, the output will be:
# (2018-04-23 17:18:38.8 - 2018-04-23 17:17:49.7) = (38.8 + 10.3) = "49.1"
# <- only this number is a string
# [X] * If there are no valid events at the entrance or it is the only one
#       to return "0"
# [X] * If there are many events, the methods should return an array of duration
# between 1st and 2nd, 2nd and 3rd and etc. Example: ["40.1", "42.2"]
require 'date'

class Task3
  DATETIME_FORMAT = /\d{4}-\d{2}-\d{2} \d{1,2}:\d{1,2}:\d{1,2}.\d{1}/.freeze

  def initialize(file_name)
    @file_name = file_name
    @valid_line_arr = []
    @arr_durations = []
  end

  def task_3
    check_file_name? ? parse_log_file : puts('File not found!')
    output_result
    output_array_durations
  end

  private

  attr_reader :file_name, :valid_line_arr, :arr_durations

  def check_file_name?
    File.exist?(file_name) ? true : false
  end

  def parse_log_file
    File.foreach(file_name) do |line|
      valid_line_arr << add_hash(line) if format_match?(line)
    end
  end

  def output_result
    valid_line_arr.each_cons(2) do |hash|
      reduced = hash[1]
      subtracted = hash[0]
      arr_durations << difference = difference(reduced, subtracted)
      puts "(#{reduced[:timedate]} - #{subtracted[:timedate]}) = #{difference}"
    end
  end

  def difference(reduced, subtracted)
    (reduced[:seconds] - subtracted[:seconds]).round(1).to_s
  end

  def output_array_durations
    if arr_durations.any?
      puts 'Array of duration between events:'
      puts arr_durations
    else
      puts 0
    end
  end

  def format_match?(line)
    line.include?('Calling core with action:') &&
      line.match?(DATETIME_FORMAT)
  end

  def add_hash(line)
    { timedate: line.match(DATETIME_FORMAT), seconds: to_seconds(line) }
  end

  def to_seconds(time)
    DateTime.strptime(time, '%Y-%m-%d %H:%M:%S.%L').to_time.to_f
  end
end

Task3.new('debug_data_test.log').task_3
