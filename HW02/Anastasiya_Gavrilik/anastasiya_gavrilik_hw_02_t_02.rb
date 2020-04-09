def task_2(logs)
  logs.to_s.split(/\n/).map do |log|
    if suitable?(log)
      "#{get_date(log)} FROM: #{get_ip(log)} TO: #{get_path(log)}"
    end
  end.compact
end

def suitable?(log)
  get_ip(log) && get_date(log) && get_path(log)
end

def get_ip(log)
  log[/\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b/]
end

def get_date(log)
  log[/\[(.*?)\]/, 1]
end

def get_path(log)
  log[/\"(.*)"/, 1]&.[](/\ (.*?) /, 1)&.upcase
end
