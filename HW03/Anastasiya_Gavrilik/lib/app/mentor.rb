module App
  class Mentor < Human
    attr_reader :students, :notifications, :homeworks

    def initialize(name:, surname:)
      super
      @students = []
      @notifications = []
      @homeworks = []
    end

    def subscribe_to(student)
      @students << student
    end

    def unsubscribe_to(student)
      @students.delete(student)
    end

    def read_notifications!
      @notifications = []
    end

    def notify(student)
      @notifications << student.homeworks.last if @students.include?(student)
    end

    def create_homework(title, homework = Homework)
      @homeworks << homework.new(title, self)
    end
  end
end
