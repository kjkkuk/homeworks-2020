def task_4(input)
  puts "Letters: #{input.scan(/[a-zA-Z]/).length}"
  puts "Digits: #{input.scan(/[0-9]/).length}"
end

task_4('3242fdgsg324')
