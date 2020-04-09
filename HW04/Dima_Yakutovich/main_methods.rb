# frozen_string_literal: true

# comment
class Array
  def my_each
    if block_given?
      i = 0

      while i < length
        yield (self[i])
        i += 1
      end
    else to_enum
    end
  end
