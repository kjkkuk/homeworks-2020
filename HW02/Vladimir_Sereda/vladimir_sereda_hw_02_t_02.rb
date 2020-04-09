# frozen_string_literal: true

DATE_TIME = %r{\[[[:alnum:]\/\s+:]+\]}.freeze
IP = /[\d.]{7,15}/.freeze
PATH = %r{[[:upper:]]{3,7}\s[\/[:lower:]\d]+}.freeze
STRING_SORT_OPTION = %r{
  [\d.]{7,15}
  \s-\s-\s
  \[[[:alnum:]\/\s+:]+\]
  \s\"[a-zA-Z0-9\/\s.]+\".*
}x.freeze

logs = File.readlines('logs/logs_ts2.txt')

def logs_formated(logs)
  logs.select { |line| line =~ STRING_SORT_OPTION }.map do |line|
    # retrieve the specified parameters
    date_time = line[DATE_TIME]
    ip = line[IP]
    path = line[PATH]
    # format output string
    "#{date_time} FROM: #{ip} TO: #{path}"
  end
end

p logs_formated(logs)
