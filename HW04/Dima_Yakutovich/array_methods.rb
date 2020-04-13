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

  def my_map
    output = []
    if block_given?
      my_each { |i| output << yield(i) }
    else to_enum
    end
    output
  end

  def my_select
    if block_given?
      output = []
      my_each do |i|
        output << i if yield(i)
      end
      output
    else to_enum
    end
  end
end
