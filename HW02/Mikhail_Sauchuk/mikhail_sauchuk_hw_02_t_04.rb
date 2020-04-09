# An arbitrary string is given, the method `task_4`
# must return the count of letters and digits in that string.

def letters_count(str)
  str.scan(/[a-zA-Z]/).size
end

def digits_count(str)
  str.scan(/[0-9]/).size
end

def main(str)
  letters = letters_count(str)
  digits = digits_count(str)
  puts "{letters: #{letters}, digits: #{digits}}"
end

main('hel2!lo')
main('wicked .. !')
