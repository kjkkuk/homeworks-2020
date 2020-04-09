puts 'File open: task_2.txt' if File.open('task_2.txt')

abort 'File is not exist!' unless File.exist?('task_2.txt')

logs = File.readlines('task_2.txt')

IP = /\d{1,3}\.\d{1,3}\.\d*\.\d*/.freeze
DATE = %r{\d.\/+\w*\/\d*\:\d.\:\d.\:\d.\s\+\d*}.freeze
MESSEGE = %r{\/\w*\/\d\/\w*}.freeze

def new_format(lines)
  array = []
  lines.each do |line|
    next unless correct_log(line)

    array.push get_formatted_log(line)
  end
  array
end

def correct_log(line)
  line.match %r{^#{IP}\s\-\s\-\s\[#{DATE}\]
  \s\"\w*\s#{MESSEGE}\s\w*\/\d\.\d\"}x
end

def get_formatted_log(line)
  ip = line.match(/#{IP}/)
  date = line.match(/#{DATE}/)
  messege = line.match(/#{MESSEGE}/)[0].upcase
  "#{date} FROM: #{ip} TO:#{messege}"
end

puts new_format(logs)
