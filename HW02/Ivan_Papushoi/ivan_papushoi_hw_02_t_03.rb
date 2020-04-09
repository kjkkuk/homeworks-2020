# method should return a string containing the duration of the action
# in SECONDS between events that occurred at the time
# of Calling core with action:
# between them can be any number of other events.

def select_valid_lines
  File.readlines(FILE_NAME).select { |l| l.downcase.include?('calling core') }
end

def take_date_time_from_lines(lines)
  reg_exp_date_time = /\d{4}\-\d{2}\-\d{2} \d{2}\:\d{2}\:\d{2}\.\d{1}/
  lines.map { |line| line.match(reg_exp_date_time)[0] }
end

def catch_ymd(record)
  y_m_d = []
  year = record.match(/\d{4}/)[0]
  month = record.match(/\-\d{2}\-/)[0].delete '-'
  day = record.match(/\-\d{2} /)[0].strip.delete '-'
  y_m_d << year << month << day
  y_m_d
end

def catch_hms(record)
  h_m_s = []
  hour = record.match(/ \d{2}/)[0].strip
  minute = record.match(/:\d{2}\:/)[0].delete ':'
  second = record.match(/\:\d{2}\.\d{1}/)[0].delete ':'
  h_m_s << hour << minute << second
  h_m_s
end

def to_nums(catched_array)
  catched_array.map { |v| v.include?('.') ? v.to_f : v.to_i }
end

def catch_date_time(record)
  to_nums(catch_ymd(record)) + to_nums(catch_hms(record))
end

def transform_dates_times_to_time_objects(lines_date_time)
  lines_date_time.map do |record|
    Time.new(catch_date_time(record)[0], catch_date_time(record)[1],
             catch_date_time(record)[2], catch_date_time(record)[3],
             catch_date_time(record)[4], catch_date_time(record)[5])
  end
end

def calc_time_between_events_sec(times_dates)
  output_array = []
  if times_dates[1].nil?
    output_array << 0
  else
    (0..times_dates.length - 2).each do |i|
      time_between_events = times_dates[i + 1] - times_dates[i]
      output_array << time_between_events.abs.round(1)
    end
  end
  output_array
end

FILE_NAME = 'user_input_t03.txt'.freeze
lines = select_valid_lines
date_times = take_date_time_from_lines(lines)
events = transform_dates_times_to_time_objects(date_times)
time_between_events = calc_time_between_events_sec(events)
puts time_between_events

# Output example (the file constists 3 events):
# 49.1
# 348.8
