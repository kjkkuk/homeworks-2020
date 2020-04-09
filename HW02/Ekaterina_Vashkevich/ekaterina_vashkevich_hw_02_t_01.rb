# writes lines from file to array
logs = File.readlines('data_t_01.txt')

# find lines from log, that contain 'error'
def line_log_error(log)
  log.find { |line| line.include? 'error' }
end

puts line_log_error(logs)
