module Enumerable
  # Your code goes here
  def my_all?
    my_each do |ele|
      return false unless yield(ele)
    end
    true
  end

  def my_any?
    my_each do |ele|
      return true if yield(ele)
    end
    false
  end

  def my_count
    count = 0
    if block_given?
      my_each do |ele|
        count += 1 if yield(ele)
      end
    else
      count = self.length
    end
    count
  end

  def my_each_with_index
    index = 0
    my_each do |ele|
      yield(ele, index)
      index += 1
    end
  end

  def my_inject(value)
    my_each do |ele|
      value = yield(value,ele)
    end
    value
  end

  def my_map
    new_array = []
    my_each do |ele|
      new_array << yield(ele)
    end
    new_array
  end

  def my_none?
    my_each do |ele|
      return false if yield(ele)
    end
    true
  end

  def my_select
    list = []
    my_each do |ele|
      list << ele if yield(ele)
    end
    list
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable

  def my_each
    for i in 0...self.length do
      yield(self[i])
    end
    self
  end
end
