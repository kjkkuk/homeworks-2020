# An arbitrary string is given, the method task_4
# must return the count of letters and digits in that string.
# example:
# task_4("hel2!lo") # --> {letters: 5, digits: 1}
# task_4("wicked .. !") # --> 6 --- {letters: 6, digits: 0}

def task_4(string)
  letters = string.scan(/[a-zA-z]/)
  digits = string.scan(/[0-9]/)
  puts "letters: #{letters.length}, digits: #{digits.length}"
end

task_4('hel2!lo')
task_4('wicked .. !')
task_4('aasd123456a')
