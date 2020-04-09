def task_1(logs)
  logs.to_s.split(/\n/).find { |line| line.match?(/error/i) }.to_s
end
