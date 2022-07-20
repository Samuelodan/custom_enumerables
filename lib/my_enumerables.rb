module Enumerable
  # Your code goes here
  def my_all?
    self.my_each do |item|
      return false unless yield(item)
    end
    true
  end

  def my_any?
    self.my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_count(member = nil)
    count = 0
    if block_given?
      self.my_each do |item|
        count += 1 if yield(item)
      end
    else
      return self.length unless member

      self.my_each do |item|
        count += 1 if member == item
      end
    end
    count
  end

  def my_each_with_index
    return self.to_enum unless block_given?

    idx = 0
    self.my_each do |item|
      yield(item, idx)
      idx += 1
    end
    self
  end

  def my_inject(acc = 0)
    self.my_each do |item|
      acc = yield(acc, item)
    end
    acc
  end

  def my_map
    result = []
    self.my_each do |item|
      result << yield(item)
    end
    result
  end

  def my_none?
    self.my_each do |item|
      return false if yield(item)
    end
    true
  end

  def my_select
    result = []
    self.my_each do |item|
      result << item if yield(item)
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return self.to_enum unless block_given?

    self.length.times do |i|
      yield self[i]
    end
    self
  end
end
