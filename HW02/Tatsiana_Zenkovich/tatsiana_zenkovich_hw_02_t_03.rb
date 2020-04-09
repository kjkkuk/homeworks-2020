# calculate time between all actions with Calling core (more then 2 also)
# taking into account that time can be on the edge of midnight
# and forming outout like this
# 49.1 seconds between calling core with action
# event
# messages

require 'time'

def task3
  lines = read_file('log.txt')
  relevant_line = parsing(lines)
  check_the_line(relevant_line)
  time_between = count_time(relevant_line)
  names = names_array(relevant_line)
  time_between = check_single_calling_core(time_between)
  final_array = creating_output(time_between, names)
  puts final_array
end

def read_file(file_name)
  File.readlines(file_name)
end

def parsing(lines)
  lines.select { |line| line.include?('Calling core with action') }
end

# check if the log contains any Calling core with action
def check_the_line(relevant_line)
  puts '0' && exit if relevant_line == []
end

# count time for each Calling core with action

def count_time(relevant_line)
  t0 = 0
  time_between = []
  relevant_line.each do |n|
    t1 = Time.parse(n)
    d = t1 - t0
    t0 = t1
    time_between << d
  end
  time_between
end

def names_array(relevant_line)
  relevant_line.map { |new_line| new_line.split(' ').last }
end

# check if there was only one Calling core with action
def check_single_calling_core(time_between)
  time_between.delete_at(0)
  time_between = [0] if time_between == []
  time_between
end

# create part of output
def creating_output(time_between, names)
  time_between.collect! do |x|
    x.to_s + ' seconds between calling core with action '
  end
  # create additional array
  names_for_array = names.clone
  names.shift
  # create and array with info about 2 actions and time between them
  time_between.zip(names_for_array, names)
end

task3
