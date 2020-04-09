def parse(filepath)
  File.readlines(filepath, chomp: true)
      .find { |i| i.downcase.include? 'error' }.to_s
end

puts 'This script can find errors in log file. Please, enter filepath: '
p parse(gets.strip)
