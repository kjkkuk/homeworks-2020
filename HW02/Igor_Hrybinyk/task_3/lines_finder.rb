class LinesFinder
  attr_reader :lines

  def initialize(lines)
    @lines = lines
  end

  LINES_FORMAT = /[cC]alling\score\swith\saction/.freeze

  def find_matching_lines
    lines.select { |line| line.match?(LINES_FORMAT) }
  end
end
