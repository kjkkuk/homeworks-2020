# frozen_string_literal: true

# create regex
IP_ADDRESS = /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/.freeze
DATE = /\[.*\]/.freeze
PATH = /POST\s\S+/.freeze
LINE_REGEXP =
  /#{IP_ADDRESS}(.-.-.)
   #{DATE}\s.
   #{PATH}.*
   /x.freeze

# read txt file as array
lines = File.readlines('input_hw_02_t_02.txt', chomp: true)

# formatd lines information
def formated_log(log)
  log.select { |line| line.match(LINE_REGEXP) }.map do |line|
    date = line.match(DATE)
    ip = line.match(IP_ADDRESS)
    path = line.match(PATH).to_s.upcase
    "#{date} FROM: #{ip} TO: #{path}"
  end
end

puts formated_log(lines)
