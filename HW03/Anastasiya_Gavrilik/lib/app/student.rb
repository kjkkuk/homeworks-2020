module App
  class Student < Human
    attr_reader :homeworks
    def initialize(name:, surname:)
      super
      @homeworks = []
    end

    def submit_homework!
      @homeworks.last.author.notify(self)
    end

    def get_and_do_homework(mentor)
      @homeworks <<  mentor.homeworks.find(&new_homework)
    end

    def new_homework
      ->(homework) { !@homeworks.include?(homework.title) }
    end
  end
end
