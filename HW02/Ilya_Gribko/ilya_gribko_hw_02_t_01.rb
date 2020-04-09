# Method task_1 should return:
# * Full text of the first line with an error
#   (the presence of the substring error in any case)
# * If the input is text that does not contain the word error,
#   return an empty string

class Task1
  def initialize(file_name)
    @file_name = file_name
    @string = ''
  end

  def task_1
    error_checking(@file_name)
  end

  private

  def error_checking(file)
    File.foreach(file) do |line|
      if line.include?('error')
        @string = line
        break # only first error line
      end
    end
    puts @string
  end
end

puts 'Return from errors file:' # error first line
Task1.new('data_test_with_errors.log').task_1

puts 'Return from NOT errors file:' # empty line
Task1.new('data_test_without_errors.log').task_1
