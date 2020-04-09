def statistic(str)
  count_letters = str.count 'a-zA-Z'
  count_numbers = str.scan(/[0-9]/).size
  puts "letters: #{count_letters}, digits: #{count_numbers};"
end

statistic('hel2!lo')
statistic('wicked .. !')
