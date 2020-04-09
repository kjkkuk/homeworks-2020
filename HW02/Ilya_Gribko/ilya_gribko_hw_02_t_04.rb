# 4. An arbitrary string is given, the method task_4 must return
# the count of letters and digits in that string.
#  Example:
#  task_4("hel2!lo") # --> {letters: 5, digits: 1}
#  task_4("wicked .. !") # --> 6 --- {letters: 6, digits: 0}

LETTERS = /[a-zA-Z]/.freeze
DIGITS = /[0-9]/.freeze

def task_4(string)
  puts to_hash(string)
end

def to_hash(string)
  { letters: count_letters(string), digits: count_digits(string) }
end

def count_letters(string)
  string.scan(LETTERS).count
end

def count_digits(string)
  string.scan(DIGITS).count
end

task_4('hel2!lo')
task_4('wicked .. !')
