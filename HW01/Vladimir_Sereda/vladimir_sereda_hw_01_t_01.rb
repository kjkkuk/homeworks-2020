puts 'Number of hourse'
hours = gets.to_i

puts 'Number of minutes'
minutes = gets.to_i

def angle(hours, minutes)
  cloc_hand_position = ((hours * 60) + minutes) * 0.5
  minute_hand_position = minutes * 6
  angle_between_cloc_and_minute_hand = cloc_hand_position - minute_hand_position
  if angle_between_cloc_and_minute_hand.abs > 180
    360 - angle_between_cloc_and_minute_hand.abs
  else
    angle_between_cloc_and_minute_hand.abs
  end
end

puts angle(hours, minutes)
