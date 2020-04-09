# frozen_string_literal: true

puts 'Please, type your string'
input = gets.chomp

numbers_count = 0
string_count = 0

input.split('').each do |x|
  numbers_count += 1 if x =~ /\d/
  string_count += 1 if x =~ /[a-z]|[A-Z]/
end

puts "letters: #{string_count}, digits: #{numbers_count}"
