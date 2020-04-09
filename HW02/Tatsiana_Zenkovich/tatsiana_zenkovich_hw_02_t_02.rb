lines = []

File.open('log.txt') do |review_file|
  lines = review_file.readlines
end
IP = /\d+\.\d+\.\d+\.\d+/.freeze
DATE = %r{\[\d+/\w+/\d{4}\:\d{2}\:\d{2}\:\d{2}\s\+\d+\]}.freeze
ADDRESS = /T .*H/.freeze
found = []
lines.each do |i|
  ip = i[IP]
  date = i[DATE]
  adr = i[ADDRESS]
  if ip && date && adr
    found << date[1..-2] + ' FROM: ' + ip + ' TO:' + adr[1..-3].upcase
  end
end
puts found
