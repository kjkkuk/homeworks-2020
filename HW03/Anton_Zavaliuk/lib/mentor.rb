require_relative 'postgres/api'
require_relative 'student'

class Mentor
  attr_accessor :name, :level, :amount, :surname

  def initialize(name, surname, level)
    @name = name
    @surname = surname
    @level = level
    @following = []
    post_gres = PostGres.instance
    post_gres.add_mentor(self)
  end

  def subscribe_to(student)
    @following.append(student)
    student.tutor.append(self)
  end

  def remove_tutor(student)
    @following.delete(student)
  end

  def notify(student, data)
    p "#{student.name} #{student.surname} did his homework. Data: #{data}"
    post_gres = PostGres.instance
    post_gres.add_notification(data, self, student)
  end
end
