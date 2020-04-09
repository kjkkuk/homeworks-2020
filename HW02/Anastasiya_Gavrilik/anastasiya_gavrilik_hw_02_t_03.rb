require 'date'

def task_3(log)
  get_time(log).any? ? get_time(log) : '0'
end

def get_time(log)
  to_lines(log)
    .map(&fetch_datetime)
    .compact
    .each_cons(2)
    .map(&duration_events)
end

def duration_between(events)
  ((events.last - events.first) * 24 * 60 * 60).to_f.to_s
end

def suitable?(event)
  event.match?(/Calling core with/)
end

def parse_datetime(log)
  DateTime.parse(log[/(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}.\d)/])
end

def to_lines(log)
  log.to_s.split(/\n/)
end

def duration_events
  ->(events) { duration_between(events) }
end

def fetch_datetime
  ->(line) { parse_datetime(line) if suitable?(line) }
end
