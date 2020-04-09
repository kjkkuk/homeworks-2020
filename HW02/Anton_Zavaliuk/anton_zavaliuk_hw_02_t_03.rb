require 'time'

DATE = /^([0-9]*-[0-9]*-[0-9]* [0-9]*:[0-9]*:[0-9]*.[0-9])/.freeze

def task_3(input)
  date = File.readlines(input)
  date_dif = date.select { |line| line.include? 'Calling core with action' }
                 .select { |line| line.match?(DATE) }
                 .map { |line| line[DATE] }
                 .each_cons(2)
                 .map { |data| calc_difference(data[0], data[1]) }
  return 0 if date_dif.empty?

  date_dif
end

def calc_difference(start_date, end_date)
  last_date = Time.parse(end_date)
  first_date = Time.parse(start_date)
  result = last_date - first_date
  return 0 if result.negative?

  result
end

puts(task_3('Anton_Zavaliuk/input_debug.txt'))
