# mentor recieves homeworks from students
# he checks all homeworks that he recived
# mentor sends back homeworks to the students
# with updated status

require_relative 'abstract_observer'

class MentorMath < AbstractObserver
  POSSIBLE_RESULTS = %w[accept accept accept reject].freeze

  def initialize(name, surname)
    super
    @students = []
  end

  def attach(student)
    puts "Mentor #{surname}: subscribes to student #{student.surname}"
    students << student
  end

  def detach(student)
    students.delete(student)
  end

  def notify
    puts "Mentor #{surname}: Your homework was checked, please see status"
    students.each { |student| student.update_homework(homeworks) }
    homeworks.clear
  end

  def update_homework(student, homework)
    puts "Mentor #{surname}: I recived homework #{homework.title} from" \
           " #{student.surname}"
    homeworks << homework
  end

  def check_homework
    homeworks.each { |homework| homework.status = POSSIBLE_RESULTS.sample }
    notify
  end
end
