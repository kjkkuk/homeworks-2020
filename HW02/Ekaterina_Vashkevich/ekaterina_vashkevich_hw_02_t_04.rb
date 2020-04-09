# finds the count of letters and digits in the string

def count_letters_digits(str)
  digits = str.scan(/[0-9]/).count
  letters = str.scan(/[A-Za-z]/).count
  "Count of letters: #{letters}, count of digits #{digits}"
end

puts count_letters_digits('Two : 2')
puts count_letters_digits('Wicked ?')
