class Student < Person
  def initialize(name:, surname:)
    super
    @active_task = nil
  end

  def subscribe_repo(repo)
    repo.students << self
  end

  def take_task(repo)
    repo.tasks.each do |task|
      next if task.status != Task::OPEN

      @active_task = task
      active_task.status = Task::IN_PROGRESS
      notify_mentors(task)
      break
    end
  end

  def submit_task!(solution)
    active_task.solution = solution
    active_task.status = Task::SUBMITTED
    notify_mentors(active_task)
  end

  def close_task!
    active_task.status = Task::CLOSED
    @active_task = nil
  end

  private

  attr_reader :active_task

  def notify_mentors(task)
    task.repo.mentors.each do |mentor|
      mentor.notifications << Notification.new(
        person: self,
        task_id: task.id,
        status: task.status
      )
    end
  end
end
