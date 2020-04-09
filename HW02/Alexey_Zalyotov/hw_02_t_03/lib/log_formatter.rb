require 'date'

class LogFormatter
  EVENT_REGEX = /.*Calling core.*/.freeze
  DATE_TIME_REGEX = /^[[:alnum:]\.\:\-\s]{21}/.freeze

  attr_reader :logs

  def initialize(logs)
    @logs = logs
  end

  def events_timestamps
    # find lines with "Calling core with action" substr
    # and parse their timestamps
    logs.select { |line| line =~ EVENT_REGEX }.map do |substr|
      DateTime.parse(substr[DATE_TIME_REGEX])
    end
  end
end
