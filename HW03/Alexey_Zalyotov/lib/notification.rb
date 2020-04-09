class Notification
  def initialize(person:, task_id:, status:)
    @person = person
    @task_id = task_id
    @status = status
  end

  def to_s
    "#{person.name} #{person.surname} has changed status of task" \
    " ##{task_id} to \"#{status}\""
  end

  private

  attr_reader :person, :task_id, :status
end
