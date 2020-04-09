# frozen_string_literal: true

require 'date'

# create regex
TIME = /^\d{4}\-\d{2}\-\d{2}\s\d{2}\:\d{2}\:\d{2}.\d{1}/.freeze

# read txt file as array and select lines
def logs
  lines = File.readlines('input_hw_02_t_03.txt', chomp: true)
  lines.select { |log| log.match(/Calling core/) }
end

def during_time(logs)
  return [0] if logs.size <= 1

  datetime = logs.map do |log|
    DateTime.strptime(log[TIME], '%Y-%m-%d %H:%M:%S.%L')
  end
  (datetime.last.to_time - datetime.first.to_time).to_s
end

puts during_time(logs)
