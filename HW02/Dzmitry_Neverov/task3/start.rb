require_relative 'logs_reader.rb'
require_relative 'time_calculator.rb'
require_relative 'line_search'

logs_to_check = LogsReader.new(ARGV[0]).read_file
need_lines = LineSearcher.new(logs_to_check).find_lines
TimeIntervalCalculator.new(need_lines).task_3
