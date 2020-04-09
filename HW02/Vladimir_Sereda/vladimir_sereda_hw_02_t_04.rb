# frozen_string_literal: true

def count_of_letters_and_digist(string)
  letters_count = string.scan(/[A-Za-z]/).join.size
  digist_count = string.scan(/[0-9]/).size
  "{letters:#{letters_count}, digist:#{digist_count}}"
end

puts count_of_letters_and_digist('hel2!lo')
puts count_of_letters_and_digist('wicked .. !')
