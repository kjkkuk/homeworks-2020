class Mentor
  attr_reader :name, :surname, :students, :tasks, :notifications

  def initialize(name, surname)
    @name = name
    @surname = surname
    @notifications = []
    @students = []
    @tasks = []
  end

  def subscribe_to(student)
    @students << student
  end

  def unsubscribe_from(student)
    @students.delete(student)
  end

  def read_notifications!
    @notifications.clear
  end

  def send_update(notification)
    @notifications << notification
  end

  def prepare_task(title, task = Task)
    @tasks << task.new(title)
  end

  def send_task_to_student(_student)
    @students.each { |student| student.get_tasks(self) }
  end
end
