def hours_minutes_angle(hours, minutes)
  h = hours.to_i % 12
  m = minutes.to_i % 60
  (hours_to_angle(h) + correction(m) - minutes_to_angle(m)).abs
end

def minutes_to_angle(minutes)
  (minutes * 360) / 60.0
end

def hours_to_angle(hours)
  (hours * 360) / 12.0
end

def correction(minutes)
  minutes * 30 / 60.0
end
puts hours_minutes_angle(3, 15)
