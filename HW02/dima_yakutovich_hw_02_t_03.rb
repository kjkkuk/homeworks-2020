require 'time'
#############
TIME_REGEX = /^\d{4}\-\d{2}\-\d{2}\s\d{2}\:\d{2}\:\d{2}\.\d{1}/.freeze
debugs = File.readlines('input_task03.txt') # logs information

def get_time(logs)
  events = logs.select { |line| line.downcase.include? 'calling core' }
  0 if events.size < 2

end

def parsing(time)
  Time.parse(time[TIME_REGEX])
end
