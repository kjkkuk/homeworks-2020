require 'time'
REGEX = %r{/^(.{21})\s[\w-]+\[\d+\]\s\w+\s-\s(.+)$/}.freeze

def format(time)
  "#{time.to_i}.#{time.usec}".to_f
end

def open_file(filepath)
  File.readlines(filepath, chomp: true)
end

def parse(file, ranges = [], last = 0)
  file.each do |line|
    (datetime, message) = line.match(REGEX)[1, 2]
    seconds = format(Time.parse(datetime))
    next unless message =~ /Calling core with action/

    ranges.push(seconds.send('-', last).round(1)) if last != 0
    last = seconds
  end
  ranges
end

puts 'This script can find errors in log file. Please, enter filepath: '
puts parse(open_file(gets.strip))
