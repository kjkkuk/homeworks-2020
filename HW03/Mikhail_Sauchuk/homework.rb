class Homework
  attr_accessor :status, :title
  STATUS = 'set'.freeze

  def initialize(title)
    @title = title
    @status = STATUS
  end
end
