DATE = /(?<=\[)(.*?)(?=\])/.freeze
LOG = /"(.*?)"/.freeze
IP_ADDR = /[0-9]*.[0-9]*.[0-9]*.[0-9]*/.freeze
PATH = /(?<= )(.*?)(?= )/.freeze

def task_2(input)
  result = File.readlines(input)
  result.select! { |line| line_validator(line) == 1 }
        .map! { |line| line_handler(line) }
end

def line_handler(line)
  date = match_reg(line, DATE)
  ip = match_reg(line, IP_ADDR)
  path = match_reg(match_reg(line, LOG), PATH)
  "\"#{date} FROM: #{ip} TO: #{path.upcase}\" ".to_s
end

def line_validator(line)
  match_reg(line, DATE && IP_ADDR && LOG && PATH).length
end

def match_reg(line, reg)
  line[reg].to_s
end

puts(task_2('Anton_Zavaliuk/input.txt'))
