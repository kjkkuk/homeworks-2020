# frozen_string_literal: true

LOG_FILE = 'logfile.txt'

IP = /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/.freeze
DATE = %r{\[\d{1,2}/[a-zA-z]{3}/\d{4}\:\d{2}\:\d{2}\:\d{2}\s\+\d{4}\]}.freeze
PATH = %r{\"\w+\s/\w+/\d+/\w+}.freeze
ANSWER = /\d{3}\s\d+\s\d+\.\d+/.freeze

FULL_LOG = %r{#{IP}\s\-\s\-\s#{DATE}\s#{PATH}\s\w+/\d+\.\d+\"\s#{ANSWER}}.freeze
def format_log_string(logs)
  file_data = File.readlines(logs).map(&:chomp)
                  .delete_if { |line| error?(line) }

  file_data.map do |line|
    next unless line.match?(FULL_LOG)

    (line.slice(DATE)[1..-2]).to_s + ' FROM ' \
    "#{line.slice(IP)} " \
    "#{line.slice(PATH).gsub('POST', 'TO')[1..-2]}"
  end
end

def error?(line)
  line.downcase.include?('error')
end

p format_log_string(LOG_FILE)
