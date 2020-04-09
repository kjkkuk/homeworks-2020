# frozen_string_literal: true

file_path = 'homeworks-2020/HW02/Yuliya_Bukhtik/yuliya_bukhtik_hw_02_t_02.rb'

def task_2(file)
  lines = File.readlines(file)

  requiered_format = Regexp.new %r{\d+\.\d+\.\d+\.\d+ - -
    \[\d{1,2}\/[a-zA-Z]+\/\d{4}:\d{1,2}:\d{1,2}:\d{1,2} \+\d+] "
    [A-Z]{4} \/[a-z]{4}\/\d\/[a-z]+ [A-Z]{4}\/1.1" .+}

  lines.select! do |line|
    line.match(/#{requiered_format}/)
  end

  # by the below method the rest lines will be parsed into the required format
  lines.map! { |line| parsing_new_line(line) }

  puts lines
end

def parsing_new_line(line)
  ip = Regexp.new '\d+\.\d+\.\d+\.\d+'
  date = Regexp.new '\d{1,2}\/[a-zA-Z]+\/\d{4}:\d{1,2}:\d{1,2}:\d{1,2} \+\d+'

  # getting POST address in upcase
  address = line[/".+"/].upcase!
  # getting required address format for output
  address_format = address[%r{/[a-zA-Z]{4}/\d/[a-zA-Z]+}]

  "#{line[date]} FROM: #{line[ip]} TO: #{address_format}"
end

task_2(file_path)
