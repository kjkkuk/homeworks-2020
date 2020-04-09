string = gets.chomp

def count_of(line)
  digits = line.scan(/[0-9]/).size
  letters = line.downcase.scan(/[a-z]/).size
  "letters: #{letters}, digits: #{digits};"
end

puts count_of(string)
