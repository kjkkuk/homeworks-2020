REGEX = %r{^([\d\.]{7,15})[-\s]{5}\[(.+)\]\s\"\w{3,6}\s([\/\w+]+).+$}.freeze

def task_2(filepath)
  File.readlines(filepath, chomp: true)
      .grep(REGEX)
      .map { |i| i.sub!(REGEX, '\2 from: \1 to \3') && i.upcase }
end

puts 'This script can find errors in log file. Please, enter filepath: '
data = task_2(gets.strip)
data.empty? ? puts('not found') : data.each { |l| puts l }
