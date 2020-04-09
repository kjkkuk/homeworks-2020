# student
class Student
  attr_reader :name, :surname, :homeworks, :notifications
  attr_accessor :mentors

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = []
    @mentors = []
    @notifications = []
  end

  def submit_homework!(homework)
    submitted_homework = Homework.new(homework)
    @homeworks << submitted_homework
    notify_mentors(homework)
  end

  def notify_mentors(homework)
    mentors.each do |mentor|
      mentor.notify_mentor(self, homework)
      mentor.notifications << Notification.new(homework)
    end
  end

  def notify_student(mentor, student)
    puts "#{mentor.name} #{mentor.surname}
 subscribe to #{student.name} #{student.surname}".delete("\n")
  end

  def read_notification!
    @notifications.clear
  end
end
