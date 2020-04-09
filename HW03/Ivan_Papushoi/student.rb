class Student
  attr_accessor :name, :submitted_homeworks,
                :denied_homeworks, :passed_homeworks

  def initialize(name)
    @name = name
    @submitted_homeworks = []
    @denied_homeworks = []
    @passed_homeworks = []
  end

  def submit_homework(task_id)
    @submitted_homeworks << task_id
    notify_mentor(task_id)
  end

  def resolve_homework(task_id)
    @denied_homeworks.delete(task_id)
    @submitted_homeworks << task_id
    notify_mentor(task_id)
  end

  def notify_mentor(task_id)
    "#{name} submit homework ##{task_id}"
  end

  def check_denied
    "#{name} check. Next homeworks denied: " + denied_homeworks.join('# ')
  end

  def check_passed
    "#{name} check. Next homeworks passed: " + passed_homeworks.join('# ')
  end

  def submitted
    submitted = "\n#{name} - ##{submitted_homeworks.join ', '} "
    submitted if submitted_homeworks.any?
  end

  def notify(task_id)
    print "Student #{name} was notified about task #{task_id} \n"
  end
end
