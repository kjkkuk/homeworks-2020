# 1. If you look at the clock and the time is 3:15,
# what is the angle between the hours and the minutes hands?
# | If this task is too easy for you,
# | try to implement a common solution for any time (3:15, 3:20, 4:30 ... etc )

class AngleTime
  def initialize
    angle_time
  end

  def angle_time
    loop do
      puts 'What time is it?(analog, e.g. 3:15, 3:20, 4:30 ... etc):'
      time = gets.chomp

      if time_check(time)
        implement(time)
        break
      else
        invalid_format_message
      end
    end
  end

  private

  def implement(time)
    time_hash = time_str_to_hash(time)
    degrees = angle(time_hash)
    puts "#{degrees} degrees"
  end

  def angle(time)
    hours_position = time[:hours] * 30
    minutes_position = time[:minutes] * 6
    angle = (hours_position - minutes_position).abs
    angle > 180 ? 360 - angle : angle
  end

  def time_str_to_hash(time)
    time_array = time.split(':')
    { hours: time_array[0].to_i, minutes: time_array[1].to_i }
  end

  def time_check(input)
    /^\d{1,2}:\d{2}$/.match?(input)
  end

  def invalid_format_message
    puts "Input format isn't valid!"
  end
end

AngleTime.new
