module App
  class Human
    attr_reader :name, :surname

    def initialize(name:, surname:)
      @name = name
      @surname = surname
    end
  end
end
