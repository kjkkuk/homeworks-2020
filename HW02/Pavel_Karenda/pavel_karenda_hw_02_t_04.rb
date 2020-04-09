def task_4(input)
  digits = input.scan(/\d/).length
  letters = input.scan(/[a-zA-Z]/).length
  "the string '#{input}' contains #{letters} letter(s) and #{digits} digit(s)"
end

task_4('hel2!lo ..!#.')
