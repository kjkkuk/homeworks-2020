DATE_TIME_REGEX = %r{\[[[:alnum:]\/\s+:]+\]}.freeze
IP_REGEX = /[\d.]{7,15}/.freeze
REQ_PATH_REGEX = %r{[[:upper:]]{3,7}\s[\/[:lower:]\d]+}.freeze
LINE_REGEX = /
  #{IP_REGEX}\s-\s-\s
  #{DATE_TIME_REGEX}\s\"
  #{REQ_PATH_REGEX}.*
/x.freeze
# logs information from file to array
logs = File.readlines("#{__dir__}/fixtures/data_hw_02_t_02.txt", chomp: true)

def logs_formated(logs)
  # find all lines with POST query
  logs.select { |line| line =~ LINE_REGEX }.map do |line|
    # extract needed substrings
    date_time = line[DATE_TIME_REGEX][1..-2]
    ip = line[IP_REGEX]
    path = line[REQ_PATH_REGEX].gsub(/POST /, '').upcase
    # format output string
    "#{date_time} FROM: #{ip} TO: #{path}"
  end
end

p logs_formated(logs)
