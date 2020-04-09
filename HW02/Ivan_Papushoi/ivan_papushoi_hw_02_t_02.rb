# Method should return an array of formatted strings
# containing information about post requests
# lines that do not match the format should be ignored
# if there is no suitable string at the input,
# the method should return an empty array

def receive_valid_lines_from_file
  File.readlines(FILE_NAME).select { |line| line.downcase.include?('post') }
end

def transform_lines(string_array)
  string_array.map do |string|
    ip_match = string.match(/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/)[0]
    date_match = string.match(/\[(.+)\]/)[0].delete '[]'
    message_match = string.match(/\"(.+)\"/)[0].delete '" POST HTTP1.1'.upcase
    { adr: ip_match, date: date_match, msg: message_match }
  end
end

def format_to_output(input_array)
  input_array.map { |str| "#{str[:date]} FROM: #{str[:adr]} TO: #{str[:msg]}" }
end

FILE_NAME = 'user_input_t01_t02.txt'.freeze
lines = receive_valid_lines_from_file
transformed_lines = transform_lines(lines)
output = format_to_output(transformed_lines)
puts output
