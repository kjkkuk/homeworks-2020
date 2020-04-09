require 'time'

class TimeCalculator
  attr_reader :matching_lines

  def initialize(matching_lines)
    @matching_lines = matching_lines
  end

  TIME_FORMAT = /\d{4}\-\d{,2}\-\d{,2}\s\d{,2}\:\d{,2}\:\d{,2}\.\d{,2}/.freeze

  def calculate_difference
    if find_time.empty?
      puts '0'
    else
      converted_times = []
      find_time.each do |time|
        converted_times << Time.parse(time)
      end
      puts "Result - #{converted_times[-1] - converted_times[0]}"
    end
  end

  private

  def find_time
    matching_lines.each do |lines|
      lines.match(TIME_FORMAT)
    end
  end
end
