def count_digits_letters(input)
  "#{input.count '0-9'} digits, #{input.downcase.count 'a-z'} letters"
end

count_digits_letters('Hello, 123!')
