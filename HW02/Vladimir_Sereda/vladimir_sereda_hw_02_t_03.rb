# frozen_string_literal: true

require 'time'
log = File.readlines('logs/logs_ts3.txt')

REGEX_TIME = /^\d{4}\-\d{2}\-\d{2}\s\d{2}\:\d{2}\:\d{2}.\d{1}/.freeze

def duration_action(logs)
  string_key = logs.select { |line| line.include? 'Calling core' }
  return 0 if string_key.size < 2

  (rezult = calculate_duration_time(string_key)).delete_at(rezult.size - 1)
  rezult
end

def calculate_duration_time(string_key)
  string_key.map.with_index do |line, index|
    if index < string_key.size - 1
      first =  Time.parse(line[REGEX_TIME])
      next_line = string_key[index + 1]
      last = Time.parse(next_line[REGEX_TIME])
      (last - first).to_s
    end
  end
end

p duration_action(log)
