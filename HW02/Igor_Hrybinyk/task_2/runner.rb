require_relative 'logs_reader.rb'
require_relative 'logs_changer.rb'

logs_to_check = LogsReader.new(ARGV[0]).read_file
LogsChanger.new(logs_to_check).format_logs
