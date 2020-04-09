require_relative 'logs_reader.rb'
require_relative 'lines_finder.rb'
require_relative 'time_calculator.rb'

logs_to_check = LogsReader.new(ARGV[0]).read_file
matching_lines = LinesFinder.new(logs_to_check).find_matching_lines
TimeCalculator.new(matching_lines).calculate_difference
