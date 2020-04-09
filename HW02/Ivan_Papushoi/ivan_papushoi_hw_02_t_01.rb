# full text of the first line with an error
# (the presence of the substring error in any case)
# If the input is text that does not contain the word error,
# return an empty string

def receive_filelines
  File.readlines(FILE_NAME)
end

def return_line_with_error(file_lines)
  file_lines.detect { |line| line.downcase.include?('error') }
end

FILE_NAME = 'user_input_t01_t02.txt'.freeze
puts return_line_with_error(receive_filelines)
