# frozen_string_literal: true

require 'time'

LOG_FILE = 'logfile_task_3.txt'

SUBSTRING = 'calling core'
TIME_TEMPLATE = /^\d{4}\-\d{2}\-\d{2}\s\d{2}\:\d{2}\:\d{2}\.\d{1}/.freeze

def duration_of_actions(logs)
  # Create array of logs
  file_data = File.readlines(logs).map(&:chomp)
                  .delete_if { |line| core?(line) }
  return 0 if file_data.size < 2

  # Fill in hash
  file_data.each_cons(2).map do |item|
    (parse_time(item.last) - parse_time(item.first)).to_s
  end
end

# Find substring
def core?(line)
  !line.downcase.include?(SUBSTRING)
end

# Parsing time
def parse_time(line)
  Time.parse(line[TIME_TEMPLATE])
end

p duration_of_actions(LOG_FILE)

# Output: ["49.1", "40.0"]
