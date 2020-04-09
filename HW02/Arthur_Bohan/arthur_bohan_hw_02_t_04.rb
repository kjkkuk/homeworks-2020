# frozen_string_literal: true

def scan_word(str)
  digits = str.scan(/\d/).size
  letters = str.scan(/[a-zA-Z]/).size
  puts "letters #{letters}, digits: #{digits}"
end

scan_word('hel2!lo')
scan_word('wicked .. !')
