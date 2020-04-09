def task1
  lines = File.readlines('log.txt')
  lines.find { |line| line.include?('error') }
end

puts task1
