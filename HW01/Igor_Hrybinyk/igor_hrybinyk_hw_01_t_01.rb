# 1. If you look at the clock and the time is 3:15,
# what is the angle between the hours and the minutes hands?

class AngleCounter
  attr_reader :hours, :minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def hours_to_angles
    result = (hour_angle - minutes_angle).abs
    puts result
  end

  private

  def hour_angle
    (hours + hour_delta) * 30
  end

  def hour_delta
    minutes.to_f / 60
  end

  def minutes_angle
    minutes.to_f * 6
  end
end

AngleCounter.new(3, 15).hours_to_angles
AngleCounter.new(0, 0).hours_to_angles

# Trying to access attributes with attr_reader
ang = AngleCounter.new(3, 15)
puts "#{ang.hours} - inserted hours"
puts "#{ang.minutes} - inserted minutes"
