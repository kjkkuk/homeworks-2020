abort 'File is not exist!' unless File.exist?('task_1.txt')

lines = File.readlines('task_1.txt')

def task_1(logs)
  logs.each do |line|
    return line if line.include?('error')
  end
end

puts task_1(lines)
