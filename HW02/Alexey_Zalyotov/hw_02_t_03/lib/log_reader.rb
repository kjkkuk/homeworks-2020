class LogReader
  def initialize(file)
    @file = file
  end

  def logs_array
    # logs information from file to array
    File.readlines(file, chomp: true)
  end

  private

  attr_reader :file
end
