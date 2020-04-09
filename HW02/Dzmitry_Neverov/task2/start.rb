require_relative 'logs_reader.rb'
require_relative 'logs_validator.rb'

logs = LogsReader.new(ARGV[0]).read_file
LogsValidator.new(logs).task_2
