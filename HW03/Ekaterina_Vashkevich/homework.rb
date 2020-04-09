class Homework
  attr_reader :number, :description, :link

  def initialize(number, description, link)
    @number = number
    @description = description
    @link = link
  end

  def to_s
    "{#{number}, #{description}, #{link}}"
  end
end
