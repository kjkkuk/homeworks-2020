class LogsChanger
  attr_reader :logs_for_formatting

  def initialize(logs_for_formatting)
    @logs_for_formatting = logs_for_formatting
  end

  LOG_FORMAT = %r{
    (?<ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}).{5}\[
    (?<date>\d{1,2}/\w{3}/\d{4}\:\d{,2}:\d{,2}:\d{,2}\s\+\d{4})\]\s"POST\s
    (?<url>/\w+/\d+/\w+)\s
  }x.freeze

  def format_logs
    match_count = 0
    logs_for_formatting.readlines.map do |line|
      next unless line.match?(LOG_FORMAT)

      matches = line.match(LOG_FORMAT)
      puts "#{matches[:date]} FROM: #{matches[:ip]} TO: #{matches[:url].upcase}"
      match_count += 1
    end

    puts if match_count.zero?
  end
end
