if File.exist? 'edited_logs.txt'
  logs = File.readlines('logs.txt') # logs information

  def logs_form(edited_logs)
    edited_logs.select { |lines| lines.include? 'POST' }.map do |str|
      ip = str.match(/([0-9]{1,3}[\.]){3}[0-9]{1,3}/)
      date = str.match(%r{(\w+/\w+/\w+.+\+\w+)})
      message = str.match(/POST\s\S+/).to_s.gsub(/POST /, '').upcase
      "#{date} FROM: #{ip} TO: #{message}"
    end
  end

  File.new('edited_logs.txt', 'w')

  if File.exist? 'edited_logs.txt'
    File.open('edited_logs.txt', 'w') do |file|
      logs_form(logs).each { |lines| file.puts(lines) }
    end
  end
end
