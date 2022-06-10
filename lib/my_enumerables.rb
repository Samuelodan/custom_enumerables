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
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return self.to_enum unless block_given?

    for i in self
      yield i
    end
    self
  end
end
