class Repo
  attr_accessor :tasks, :students, :mentors

  def initialize
    @tasks = []
    @mentors = []
    @students = []
  end

  def show_tasks
    if tasks.empty?
      puts 'No tasks'
    else
      tasks.each do |task|
        puts task.formated_task
      end
    end
  end
end
