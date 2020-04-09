require_relative 'lib/log_reader'
require_relative 'lib/log_formatter'
require_relative 'lib/duration_calculator'
require_relative 'lib/output_printer'

module App
  def self.run
    # read logs from file
    log_array = LogReader.new("#{__dir__}/fixtures/data_hw02t03.txt").logs_array
    # scan logs from array and take timestamps of event
    logs_timestamps = LogFormatter.new(log_array).events_timestamps
    # calculate duration
    duration = DurationCalculator.new(logs_timestamps)
    # output
    puts OutputPrinter.new(duration.total).to_s
  end
end

App.run
