def task_1(input)
  File.open(input).each do |line|
    return line if line.include? 'error'
  end
  ''
end

puts(task_1('Anton_Zavaliuk/input.txt'))
