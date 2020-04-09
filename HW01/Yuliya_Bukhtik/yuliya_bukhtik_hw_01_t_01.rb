# frozen_string_literal: true

def angle_calculaton(hour = 3, minutes = 15)
  (hour.to_f + (minutes.to_f / 60)) * 30 - minutes.to_f * 6
end
puts angle_calculaton
