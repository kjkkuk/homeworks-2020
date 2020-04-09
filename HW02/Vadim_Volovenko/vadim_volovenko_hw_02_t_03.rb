require 'time'

TIME_REGEXP = /^\d{4}\-\d{2}\-\d{2}\s\d{2}\:\d{2}\:\d{2}.\d{1}/.freeze

def logs
  File.readlines('fixtures/data_for_t_03.txt', chomp: true).select do |log|
    log =~ /Calling core/
  end
end

def task_3(logs)
  abort 'Empty file' if logs.empty?
  datetimestamps = logs.map do |log|
    Time.parse(log[TIME_REGEXP], '%Y-%m-%d %H:%M:%S.%L')
  end
  result = (datetimestamps.last.to_time - datetimestamps.first.to_time).to_f
  result < 2 ? 0 : result
end

puts task_3(logs)
