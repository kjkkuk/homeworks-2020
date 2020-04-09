require 'time'

class DurationCalculator
  def initialize(timestamps)
    @timestamps = timestamps
  end

  def total
    timestamps.each_cons(2).map do |pair|
      (pair[1].to_time.to_f - pair[0].to_time.to_f).round(1).to_s
    end
  end

  private

  attr_reader :timestamps
end
