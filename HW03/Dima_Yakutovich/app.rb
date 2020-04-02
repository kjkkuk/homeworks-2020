# frozen_string_literal: true

require 'student'
require 'mentor'
require 'notifications'
require 'homework'
require 'student'
require 'lections'

module App
  def self.run
    student = Student.new(name: 'John', surname: 'Doe')
    mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')
    # TODO:
    # set lections
    # notify about lections
    # read lections
    # mentor create hw
    # mentor send hw
    # notify about send
    # student take hw
    # student do hw
    # student ask q
    # notify mentor about q
    # mentor ans q
    # notify student about ans
    # student complete task
    # student send task
    # notify mentor
    # mentor check tasks
    # notify if errors
    # mentor merge task
    # notify student about checked
    #
    #########################################

    # set lections
    lections = mentor.set_lections(title: '', description: '') ####
    # notify about lections
    student.notifications ####
    # read lections
    mentor.read_lections(lections) ####
    # mentor create hw
    homework = mentor.add_tasks(description: 'HW03 by ', student: student) ####
    # notify about create
    student.notifications ####
    # student take hw, student do hw
    student.do_tasks(homework) ####
    # student ask q
    student.ask_questions(question, 'any questions') ####
    # notify mentor about q
    mentor.notification ####
    # mentor ans q
    mentor.answer_questions(question, 'any answers') ####
    # notify student about ans
    student.notifications ####
    # student send task
    student.to_check(homework) ####
    # mentor check tasks
    # notify if errors
    # mentor.notifications
    # mentor.reject!(homework)
    # mentor merge task
    mentor.accept!(homework) ####
    # notify student about checked
    student.notifications

    ########################################################
  end
end

App.run
