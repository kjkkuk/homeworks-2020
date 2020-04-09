def task_4(log)
  { letters: log.to_s.scan(/[A-Za-z]/).count, digits: log.scan(/\d/).count }
end
