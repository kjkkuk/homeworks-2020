# frozen_string_literal: true

LOG_FILE = 'logfile.txt'
TEMPLATE = /error/.freeze
def find_error_logs(logs)
  File.readlines(logs).find { |line| line =~ TEMPLATE }
end

p find_error_logs(LOG_FILE)
