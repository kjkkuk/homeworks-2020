# logs information from file to array
logs = File.readlines("#{__dir__}/fixtures/data_hw_02_t_01.txt", chomp: true)

# find all lines, that contain substr 'error' in any case
def error_line(logs)
  logs.select { |line| line.downcase =~ /.*error.*/ }
end

puts error_line(logs)
