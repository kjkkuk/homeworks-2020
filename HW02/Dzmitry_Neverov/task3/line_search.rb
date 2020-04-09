class LineSearcher
  NEED_LOG = /.*Calling core with action.*/.freeze
  attr_reader :some_lines

  def initialize(some_lines)
    @some_lines = some_lines
  end

  def find_lines
    some_lines.select { |line| line.match?(NEED_LOG) }
  end
end
