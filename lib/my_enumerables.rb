module Enumerable
  # Your code goes here
  def my_each_with_index
    (self.length).times do |idx|
      yield(self[idx], idx)
    end
    self
  end

  def my_select
    array = []
    self.my_each do |elem|
      array << elem if yield(elem)
    end
    array
  end

  def my_all?
    self.my_each do |elem|
      return false unless yield(elem)
    end
    true
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_none?
    self.my_each do |elem|
      return false if yield(elem)
    end
    true
  end

  def my_count(&myblock)
    if block_given?
      return (self.my_select(&myblock)).length
    end
    self.length
  end

  def my_map
    array = []
    self.my_each do |elem|
      array << yield(elem)
    end
    array
  end

  def my_inject(initial_value)
    acumulator = initial_value
    self.my_each do |elem|
      acumulator = yield(acumulator, elem)
    end
    acumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    (self.length).times do |idx|
      yield(self[idx])
    end
    self
  end
end
