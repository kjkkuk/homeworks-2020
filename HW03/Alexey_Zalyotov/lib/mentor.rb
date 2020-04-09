class Mentor < Person
  def create_repo
    Repo.new
  end

  def create_task!(body, repo)
    id = repo.tasks.size + 1
    @active_task = Task.new(body: body, repo: repo, id: id)
    repo.tasks << active_task
    repo.mentors << self
    notify_students(active_task)
  end

  def review_task!(comment)
    active_task.status = Task::REVIEWED
    active_task.review_comment = comment
    notify_students(active_task)
  end

  def approve_task!
    active_task.status = Task::APPROVED
    notify_students(active_task)
    @active_task = nil
  end

  def subscribe_repo(repo)
    repo.mentors << self
  end

  private

  attr_reader :active_task

  def notify_students(task)
    task.repo.students.each do |student|
      student.notifications << Notification.new(
        person: self,
        task_id: task.id,
        status: task.status
      )
    end
  end
end
