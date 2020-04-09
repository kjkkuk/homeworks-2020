class StudentNotification
  attr_reader :homework

  def initialize(homework:)
    @homework = homework
  end

  def add_new_homework
    notify(message: "Add new homework '#{homework.title}'!")
  end

  def accept_homework
    notify(message: "Your homework '#{homework.title}' accepted!")
  end

  def reject_homework
    notify(message: "Your homework '#{homework.title}' rejected!")
  end

  private

  def notify(message:)
    student_notifications << message
  end

  def student_notifications
    homework.student.notifications
  end
end
