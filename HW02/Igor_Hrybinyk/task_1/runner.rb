require_relative 'logs_reader.rb'
require_relative 'errors_finder.rb'

logs_to_check = LogsReader.new(ARGV[0]).read_file
ErrorsFinder.new(logs_to_check).check_for_errors
