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
    #########################################

    # set lections
    lections = mentor.set_lections(title: '', description: '') ####
    # notify about lections
    student.notifications ####
    # read lections
    student.read_leactions(lections) ####
    # mentor create hw
    homework = mentor.add_tasks(description: 'HW03 by ', student: student) ####
    # notify about create
    student.notifications ####
    # student take hw, student do hw
    student.do_tasks(homework) ####
    # student ask q
    student.ask_questions(question, 'any questions') ####
    # notify mentor about q
    mentor.notification
    # mentor ans q
    mentor.answer_questions(question, 'any answers') ####
    # notify student about ans
    student.notifications
    # student complete task
    # student send task
    # notify mentor
    # mentor check tasks
    student.to_check(homework)
    # notify if errors
    mentor.reject!(homework)
    # mentor merge task
    mentor.accept!(homework)
    # notify student about checked
    student.notifications

    ########################################################
    student.submit_homework!(homework_data)
    student.homeworks # => [Homework, ...]

    mentor.subscribe_to(student)
    mentor.notifications # => []

    student.submit_homework!(homework_data)
    mentor.notifications # => [Notification, ...]

    mentor.read_notifications!
    mentor.notifications # => []

    # student see notification about new homework
    student.notifications
    # student mark as read all notifications
    student.mark_as_read!
    # mentor subscribe to student
    mentor.subscribe_to!(student)
    # student take to work homework
    student.to_work!(homework)
    # mentor see notification about homework to work
    mentor.notifications
    # mentor mark as read all notifications
    mentor.mark_as_read!
    # student can see homeworks
    student.homeworks
    # student add answer to homework
    student.add_answer!(homework, 'new students answer')
    # student sent to check homework
    student.to_check!(homework)
    # mentor see notification about homework to check
    mentor.notifications
    # mentor reject homework
    mentor.reject!(homework)
    # student see notification about homework was reject
    student.notifications
    # ---
    student.add_answer!(homework, 'new students answer_after reject')
    student.to_check!(homework)
    # -----------------------
    # mentor accept homework
    mentor.accept!(homework)
    # student see notification about homework was accept
    student.notifications
  end
end

App.run
