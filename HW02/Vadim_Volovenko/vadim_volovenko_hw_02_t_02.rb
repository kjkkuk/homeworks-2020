DATE_REGEX = /[\[].*[\]]/.freeze
IP_REGEX = /[\d.]{11}/.freeze
PATH_REGEX = /POST\s\S+/.freeze
LINE_REGEX = /
  #{IP_REGEX}\s-\s-\s
  #{DATE_REGEX}\s\"
  #{PATH_REGEX}.*
/x.freeze

logs = File.readlines('fixtures/data_for_t_01.txt', chomp: true)

def task_2(logs)
  logs_output = logs.select { |line| line =~ LINE_REGEX }.map do |line|
    date = line[DATE_REGEX]
    ip = line[IP_REGEX]
    path = line[PATH_REGEX].upcase
    "#{date} FROM: #{ip} TO: #{path}"
  end
  logs_output.empty? ? '' : logs_output
end

puts task_2(logs)
