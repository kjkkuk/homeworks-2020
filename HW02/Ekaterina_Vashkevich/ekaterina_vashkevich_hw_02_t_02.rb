# writes lines from file to array
logs = File.readlines('data_t_02.txt')
IP = %r{/\d+.\d+\.\d+\.\d+/}.freeze
DATA = %r{/\[\d{2}\/\w+\/\d{4}\:\d{2}\:\d{2}\:\d{2} \+\d{4}\]/}.freeze
PATH = %r{/\/\w+\/\w+\/\w+/}.freeze
REGEX_POST = %r{/#{IP} - - #{DATA} "POST #{PATH}/}.freeze

# formated line from log, that match REGEX_POST
def formated_log(log)
  log.select { |line| line.match(REGEX_POST) }.map do |line|
    "#{line[DATA]} FROM: #{line[IP]} TO: #{line[PATH].upcase}"
  end
end

puts formated_log(logs)
