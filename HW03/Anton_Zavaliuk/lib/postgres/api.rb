require 'pg'
require 'singleton'

class PostGres # rubocop:disable Metrics/ClassLength
  include Singleton

  def connect
    connection = PG.connect dbname: 'rubyhw',
                            user: 'postgres', password: 'zzA7KGVN'
  rescue PG::Error => e
    puts e.message
  else
    connection
  end

  def init_students
    connection = connect
    connection.exec 'DROP TABLE IF EXISTS students'
    connection.exec "CREATE TABLE students(id serial primary key,
        name varchar(20), surname varchar(20), mark int, amount int)"
    connection.exec "INSERT INTO students (name, surname, mark, amount)
              VALUES('Anton', 'Zavaliuk', 7, 8)"
    connection.exec "INSERT INTO students (name, surname, mark, amount)
              VALUES('Tanya', 'Alabeshkina', 9, 4)"
    close(connection)
  end

  def init_mentors
    connection = connect
    connection.exec 'DROP TABLE IF EXISTS mentors'
    connection.exec "CREATE TABLE mentors(id serial primary key,
        name varchar(20), surname varchar(20), level int)"
    connection.exec "INSERT INTO mentors (name, surname, level)
              VALUES('Anton', 'Zaletilo', 1)"
    connection.exec "INSERT INTO mentors (name, surname, level)
              VALUES('Lesha', 'SuperKlio', 2)"
    close(connection)
  end

  def add_student(value)
    connection = connect
    str = "INSERT INTO students (name, surname, mark, amount) VALUES
     ('#{value.name}', '#{value.surname}', #{value.mark}, #{value.amount})"
    connection.exec str
    close(connection)
  end

  def add_mentor(value)
    connection = connect
    str = "INSERT INTO mentors (name, surname, level) VALUES
     ('#{value.name}', '#{value.surname}', #{value.level})"
    connection.exec str
    close(connection)
  end

  def update_student(value)
    connection = connect
    connection.exec "UPDATE students SET mark = #{value.mark},
      amount = #{value.amount} WHERE name = '#{value.name}'
      AND surname = '#{value.surname}'"
    close(connection)
  end

  def levelup_mentor(value)
    connection = connect
    connection.exec "UPDATE mentors SET level = #{value.level + 1},
      WHERE name = '#{value.name}' AND surname = '#{value.surname}'"
    close(connection)
  end

  def select(value)
    connection = connect
    selected_item = if value.class == Student
                      connection.exec "select * FROM students WHERE
                      name = '#{value.name}' AND surname = '#{value.surname}'"
                    else
                      connection.exec "select * FROM mentors WHERE
                      name = '#{value.name}' AND surname = '#{value.surname}'"
                    end
    close(connection)
    selected_item.first
  end

  def delete(value)
    connection = connect
    if value.class == Student
      connection.exec "DELETE FROM students WHERE name = '#{value.name}'
                AND surname = '#{value.surname}'"
    else
      connection.exec "DELETE FROM mentors WHERE name = '#{value.name}'
                AND surname = '#{value.surname}'"
    end
    close(connection)
  end

  def init_notifications
    connection = connect
    connection.exec 'DROP TABLE IF EXISTS notifications'
    connection.exec "CREATE TABLE notifications(id serial primary key,
        message text, m_name varchar(20), m_surname varchar(20),
        st_name varchar(20), st_surname varchar(20))"
    close(connection)
  end

  def add_notification(value, mentor, student)
    connection = connect
    str = "INSERT INTO notifications
           (message, m_name, m_surname, st_name, st_surname)
           VALUES ('#{value}', '#{mentor.name}', '#{mentor.surname}',
           '#{student.name}', '#{student.surname}')"
    connection.exec str
    close(connection)
  end

  def delete_notification(mentor, student)
    connection = connect
    connection.exec "DELETE FROM notifications WHERE m_name = '#{mentor.name}'
              AND m_surname = '#{mentor.surname}'
              AND st_name = '#{student.name}'
              AND st_surname = '#{student.surname}'"
    close(connection)
  end

  def close(connection)
    connection&.close
  end
end
