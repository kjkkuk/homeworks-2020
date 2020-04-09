# frozen_string_literal: true

file_path = 'log_file_task_01.txt'

def task_1(file)
  IO.foreach(file) do |line|
    puts line if line.include? 'error'
  end
end

task_1(file_path)
