# mentor
class Mentor
  attr_reader :name, :surname, :notifications
  attr_accessor :students

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @students = []
    @notifications = []
  end

  def subscribe_to(student)
    student.mentors << self
    @students << student
    notify_students
  end

  def notify_students
    students.each do |student|
      student.notify_student(self, student)
      student.notifications << Notification.new(student)
    end
  end

  def notify_mentor(student, homework)
    puts "#{student.name} #{student.surname} submits: #{homework} "
  end

  def read_notification!
    @notifications.clear
  end
end
