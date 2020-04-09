def letters_digits_counter(str)
  letters_amount = str.scan(/[a-zA-Z]/).join.size
  digits_amount = str.scan(/\d/).size
  "{letters: #{letters_amount}, digits: #{digits_amount}}"
end

puts letters_digits_counter('hel2!lo')
puts letters_digits_counter('wicked .. !')
