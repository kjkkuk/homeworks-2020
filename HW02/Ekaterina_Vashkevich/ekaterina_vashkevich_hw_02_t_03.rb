require 'time'

# writes lines from file to array
log = File.readlines('data_t_03.txt')

REGEX_TIME = /^\d{4}\-\d{2}\-\d{2}\s\d{2}\:\d{2}\:\d{2}.\d{1}/.freeze

def duration_action(logs)
  string_action = logs.select { |line| line.include? 'Calling core' }
  return 0 if string_action.size < 2

  (rezult = calculate_duration_time(string_action)).delete_at(rezult.size - 1)
  rezult
end

# finds duration time betwenn 1st and 2nd event, 2nd and 3rd etc.
def calculate_duration_time(string_action)
  string_action.map.with_index do |line, index|
    if index < string_action.size - 1
      start =  Time.parse(line[REGEX_TIME])
      next_line = string_action[index + 1]
      finish = Time.parse(next_line[REGEX_TIME])
      (finish - start).to_s
    end
  end
end

p duration_action(log)

# output : ["49.1", "35.0"]
