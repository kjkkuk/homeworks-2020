logs = File.readlines('logs.txt') # logs information with error

def logs_errors(errors)
  errors.select { |lines| lines.include? 'error' }
end

File.new('errors.txt', 'w')
File.open('errors.txt', 'w') do |file|
  logs_errors(logs).each { |x| file.puts(x) }
end
