logs = File.readlines('logs.txt') # logs information with error

def logs_errors(errors)
  errors.select { |lines| lines.include? 'error' }
end
