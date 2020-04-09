class ErrorsFinder
  attr_reader :logs_to_check

  def initialize(logs_to_check)
    @logs_to_check = logs_to_check
  end

  def check_for_errors
    puts logs_to_check.readlines.select { |line| line =~ /error/ }.first
  end
end
