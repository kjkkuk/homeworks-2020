class AngleCalculator
  attr_reader :hours, :minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def calc_angle
    result = ((60 * hours + minutes) / 2 - 6 * minutes).abs
    result = 360 - result if result > 180
    result
  end
end

p 'This prgram is to calculate angle between hours and minutes hands'
def put_hours
  p 'Please, enter hours from keyboard:'
  hours = gets.chomp.to_i
  if hours.negative? || hours > 12
    p 'wrong input! Please write the number in range 0...12'
    put_hours
  end
  hours
end

def put_minutes
  p 'Please, enter minutes from keyboard:'
  minutes = gets.chomp.to_i
  if minutes.negative? || minutes > 59
    p 'wrong input! Please write the number in range 0...59'
    put_minutes
  end
  minutes
end

hours = put_hours
minutes = put_minutes

p "Answer: #{AngleCalculator.new(hours, minutes).calc_angle} grad"
