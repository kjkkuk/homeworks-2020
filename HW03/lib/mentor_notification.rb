class MentorNotification
  attr_reader :homework

  def initialize(homework:)
    @homework = homework
  end

  def homework_to_work
    notify(message: "Student '#{student_full_name}' " \
                    "accept to work: #{homework.title}!")
  end

  def homework_to_check
    notify(message: "Student '#{student_full_name}' " \
                    "send to check: #{homework.title}!")
  end

  private

  def notify(message:)
    student_mentors.each do |mentor|
      mentor.notifications << message
    end
  end

  def student_full_name
    "#{homework.student.name} #{homework.student.surname}"
  end

  def student_mentors
    homework.student.mentors
  end
end
