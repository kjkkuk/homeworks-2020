class LogsReader
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def read_file
    File.open(filename)
  end
end
