require 'time'

abort 'File is not exist!' unless File.exist?('task_2.txt')

logs = File.readlines('task_3.txt')

def get_events_interval(lines)
  valid_events = lines.select { |line| line.include?('Calling core with') }
  return [0] if valid_events.size <= 1

  valid_events.each_cons(2).map do |first, second|
    first_log = first.match(/^\d*\-\d.\-\d. \d.\:\d.\:\d.\.\d/)[0]
    second_log = second.match(/^\d*\-\d.\-\d. \d.\:\d.\:\d.\.\d/)[0]
    Time.parse(second_log) - Time.parse(first_log)
  end
end

puts get_events_interval(logs)
