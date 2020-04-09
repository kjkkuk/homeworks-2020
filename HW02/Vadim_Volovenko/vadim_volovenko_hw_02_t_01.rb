logs = File.readlines('fixtures/data_for_t_01.txt', chomp: true)

def task_1(logs)
  logs.find { |log| log.downcase.include?('error') }.to_s
end

puts task_1(logs)
