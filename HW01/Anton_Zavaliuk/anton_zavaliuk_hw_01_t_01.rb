# frozen_string_literal: true

# method to get angle of hour arrow and minute arrow and get difference
def cal_angle(hour, min)
  one_min_angle = 2 * Math::PI / 60.0
  one_hour_angle = 2 * Math::PI / 12.0
  hour_angle = one_hour_angle * (hour + (min / 60.0))
  min_angle = min * one_min_angle
  ((hour_angle - min_angle) % (2 * Math::PI)).abs
end

print "Difference in radians: #{cal_angle(3, 15)}"
