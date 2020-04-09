# abstract subject class
class AbstractObserver
  attr_reader :homeworks, :students, :surname

  def initialize(name, surname)
    @name = name
    @surname = surname
    @homeworks = []
  end

  def attach(_mentor)
    raise NotImplementedError, "#{self.class} has not implemented' \
                               'method '#{__method__}'"
  end

  def detach(_mentor)
    raise NotImplementedError, "#{self.class} has not implemented' \
                               'method '#{__method__}'"
  end

  def notify
    raise NotImplementedError, "#{self.class} has not implemented' \
                               'method '#{__method__}'"
  end

  def update_homework
    raise NotImplementedError, "#{self.class} has not implemented' \
    'method '#{__method__}'"
  end
end
