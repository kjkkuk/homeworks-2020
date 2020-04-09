class OutputPrinter
  def initialize(duration)
    @duration = duration
  end

  def to_s
    if duration.size >= 2
      duration.inspect
    else
      '0'
    end
  end

  private

  attr_reader :duration
end
