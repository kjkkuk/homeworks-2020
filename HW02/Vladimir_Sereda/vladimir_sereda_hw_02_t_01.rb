# frozen_string_literal: true

logs = File.readlines('logs/logs_ts1.txt', chomp: true)

def error_message(logs)
  logs.select { |keyword| keyword.downcase =~ /.*error.*/ }.first
end

puts error_message(logs)
