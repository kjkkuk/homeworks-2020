# frozen_string_literal: true

print 'Enter string: '
string = gets.chomp

LETTERS_TEMPLATE = /[a-zа-я]/.freeze
DIGITS_TEMPLATE = /\d/.freeze

def count_letters_and_digits(string)
  p 'letters: ' + string.scan(LETTERS_TEMPLATE).count.to_s
  p 'digits: ' + string.scan(DIGITS_TEMPLATE).count.to_s
end

count_letters_and_digits(string)
