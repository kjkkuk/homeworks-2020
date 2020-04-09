def task_04(str)
  letters = str.scan(/[a-zA-Z]+/).size
  digits = str.scan(/\d/).size
  "{letters: #{letters}, digits: #{digits}}"
end

puts task_04('hel2!lo')
puts task_04('wicked .. !')
