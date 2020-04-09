require 'time_difference'
require 'time'

CORE = /Calling core with action/.freeze
DATE = /^([0-9]*-[0-9]*-[0-9]* [0-9]*:[0-9]*:[0-9]*.[0-9])/.freeze

def read_file
  arr = []
  exit_error if ARGV.length != 1
  filename = ARGV[0]
  p "Going to open '#{filename}'"
  file_content = File.open(filename)

  file_content.each do |line|
    arr.push(line) if line.match(CORE)
  end
  file_content.close
  arr
end

def exit_error
  p 'We need exactly one parameter. The name of a file.'
  exit
end
arr_lines = read_file

def input_start_validity(arr)
  arr.length.zero? ? warning_input : return
end
input_start_validity(arr_lines)
def warning_input
  p 'input has no paramethers'
  exit
end

def get_date_from_line(arr_lines)
  arr_lines.map! do |elem|
    Time.parse(elem.match(DATE).to_s)
  end
end
get_date_from_line(arr_lines)

def print_result(arr_lines, diff_time)
  p "number of actions: #{arr_lines.length}"
  p "duration between actions: #{diff_time}"
end

def calc_time(arr_lines)
  diff_time = []
  (arr_lines.length - 1).times do |i|
    start_time = arr_lines[i]
    end_time = arr_lines[i + 1]
    res = TimeDifference.between(start_time, end_time).in_seconds.round(1)
    diff_time.push(res)
  end
end
print_result(arr_lines, calc_time(arr_lines))
