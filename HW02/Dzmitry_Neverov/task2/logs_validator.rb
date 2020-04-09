class LogsValidator
  attr_reader :logs_to_check

  def initialize(logs_to_check)
    @logs_to_check = logs_to_check
  end

  LOG_VALIDATE = %r{
(?<ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}).{5}\[
(?<date>\d{1,2}/\w{3}/\d{4}\:\d{,2}:\d{,2}:\d{,2}\s\+\d{4})\]\s"POST\s
(?<url>/\w+/\d+/\w+)\s
}x.freeze

  def task_2
    matches = valid_logs.map.with_index { |line, _| line.match(LOG_VALIDATE) }
    puts(matches)
  end

  private

  def valid_logs
    logs_to_check.select { |line| line.match?(LOG_VALIDATE) }
  end
end
