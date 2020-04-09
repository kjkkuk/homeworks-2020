class Task
  OPEN = :open
  IN_PROGRESS = :in_progress
  SUBMITTED = :submitted
  REVIEWED = :reviewed
  APPROVED = :approved
  CLOSED = :closed

  attr_reader :body, :repo, :id
  attr_accessor :solution, :status, :review_comment

  def initialize(body:, repo:, id:)
    @body = body
    @repo = repo
    @id = id
    @solution = 'No solution yet'
    @status = OPEN
    @review_comment = nil
  end

  def formated_task
    "____________________________\n" \
    "Task ##{id}\n" \
    "body: #{body}\n" \
    "status: #{status}\n" \
    "review_comment: #{review_comment}\n" \
    "solution: #{solution}"
  end
end
