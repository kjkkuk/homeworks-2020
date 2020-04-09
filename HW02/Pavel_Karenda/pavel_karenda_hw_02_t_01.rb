ERROR = /error/.freeze

def read_file
  arr = []
  exit_error if ARGV.length != 1
  filename = ARGV[0]
  p "Going to open '#{filename}'"
  file_content = File.open(filename)

  file_content.each do |line|
    arr.push(line) if line.match(ERROR)
  end
  file_content.close
  arr
end

def exit_error
  p 'We need exactly one parameter. The name of a file.'
  exit
end
arr_lines = read_file

def print_error(arr_lines)
  # is to smart for me
  arr_lines.empty? ? '' : (arr_lines.each { |line| return line })
end
print_error(arr_lines)
