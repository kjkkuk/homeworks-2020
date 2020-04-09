class Mentor
  attr_accessor :name, :students

  def initialize(name, students)
    @name = name
    @students = students
  end

  def create_task(task_id)
    Task.new(task_id)
    "Mentor #{name} create task ##{task_id} \n"
  end

  def notify_students(task_id)
    @students.each { |student| student.notify(task_id) }
  end

  def check_students_submitted
    print 'Mentor checks. Next students submitted their homeworks:'
    @students.each { |student| print student.submitted }
    "\n"
  end

  def set_status_success(student, task_id)
    student.submitted_homeworks.delete(task_id)
    student.passed_homeworks.push(task_id)
    "Mentor set status -success- for #{student.name} task ##{task_id}"
  end

  def set_status_fail(student, task_id)
    student.submitted_homeworks.delete(task_id)
    student.denied_homeworks.push(task_id)
    "Mentor set status -denied- for #{student.name} task ##{task_id}"
  end
end
