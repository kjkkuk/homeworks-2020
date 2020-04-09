def calc_angle_arrows(hours, minutes)
  raise 'Hours Value Out Of Range' if hours > 12 || hours.negative?
  raise 'Minutes Value Out Of Range' if minutes > 59 || minutes.negative?

  degree_hour_arrow = (hours * 60 + minutes) * 0.5
  degree_minute_arrow = minutes * 5
  (degree_minute_arrow - degree_hour_arrow).abs
end

print calc_angle_arrows(3, 15)
