ERROR = /error/.freeze
IP = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/.freeze
DATE = %r{\d{1,2}/\w{3}/\d{4}\:\d{0,2}\:\d{0,2}\:\d{0,2}\s\+\d{4}}.freeze
DESTINATION = %r{/\w+/\d+/\w+\s}.freeze

def read_file
  arr = []
  exit_error if ARGV.length != 1
  filename = ARGV[0]
  p "Going to open '#{filename}'"
  file_content = File.open(filename)

  file_content.each do |line|
    arr.push(line) unless line.match(ERROR)
  end
  file_content.close
  arr
end

def exit_error
  p 'We need exactly one parameter. The name of a file.'
  exit
end
arr_lines = read_file

def find_ip(arr)
  arr.map do |line|
    line.match(IP).to_s
  end
end

def find_date(arr)
  arr.map do |line|
    line.match(DATE).to_s
  end
end

def find_destination(arr)
  arr.map do |line|
    line.match(DESTINATION).to_s.upcase
  end
end

def print_result(arr)
  result = []
  date = find_date(arr)
  ip = find_ip(arr)
  destination = find_destination(arr)

  arr.length.times do |i|
    result.push("#{date[i]} FROM: #{ip[i]} TO: #{destination[i]}")
  end
  result
end
print_result(arr_lines)
