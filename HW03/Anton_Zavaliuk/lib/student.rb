require_relative 'postgres/api'

class Student
  attr_accessor :name, :mark, :amount, :tutor, :surname

  def initialize(name, surname, mark, amount)
    @name = name
    @surname = surname
    @mark = mark
    @amount = amount
    @tutor = []
    post_gres = PostGres.instance
    post_gres.add_student(self)
  end

  def add_mark(mark)
    @mark = (@mark * @amount + mark) / (@amount + 1)
    @amount += 1
    post_gres = PostGres.instance
    post_gres.update_student(self)
  end

  def submit_homework!(data)
    tutor.each { |teacher| teacher.notify(self, data) }
  end
end
