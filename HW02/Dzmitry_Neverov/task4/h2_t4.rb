def task_4(some_str)
  letters = some_str.scan(/[a-zA-z]/)
  digits = some_str.scan(/[0-9]/)
  puts "letters: #{letters.length}, digits: #{digits.length}"
end

task_4('dxchvjbk')
task_4('wweths!')
task_4('aywrjnsdbgfva')
