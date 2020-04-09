# frozen_string_literal: true

# An arbitrary string is given, the method `task_4`
# must return the count of letters and digits in that string.
# task_4("hel2!lo") # --> {letters: 5, digits: 1}
# task_4("wicked .. !") # --> 6 --- {letters: 6, digits: 0}

def task_4(string)
  # key_1 = 'letters'
  value1 = string.chars # we get the array of chars

  # by this method we check if elem is a letter and delete it if it's not
  value1.delete_if do |elem|
    elem != elem[/[a-zA-Z]+/]
  end

  # key_2 = 'digits'
  value2 = string.chars

  # by this method we check if elem is a digit and delete it if it's not
  value2.delete_if do |elem|
    elem != elem[/\d+/]
  end

  Hash['letters', value1.length, 'digits', value2.length]
end

task_4('hel2!lo')
# return {"letters"=>5, "digits"=>1}
