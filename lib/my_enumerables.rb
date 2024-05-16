module Enumerable
  # Your code goes here
  def my_all?
    self.my_each do |item|
      if !yield(item)
        return false
      end
    end
    return true
  end

  def my_any?
    self.my_each do |item|
      if yield item
        return true
      end
    end
    return false
  end

  def my_count
    count = 0
    self.my_each do |item|
      if block_given?
        if yield item
          count += 1
        end
      else
        count += 1
      end
    end
    return count
  end

  def my_each_with_index
    index = 0
    self.my_each do |item|
      yield item, index
      index += 1
    end
  end

  def my_inject(sum)
    self.my_each do |item|
      sum = yield sum, item
    end
    return sum
  end

  def my_map
    new_array = []
    self.my_each do |item|
      item = yield item
      new_array.append(item)
    end
    return new_array
  end

  def my_none?
    if block_given?
      self.my_each do |item|
        if yield item
          return false
        end
      end
      return true
    end
    if self.length == 0
      return true
    else 
      return false
    end
  end

  def my_select
    new_array = []
    self.my_each do |item|
      if yield item
        new_array.push(item)
      end
    end
    return new_array
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for i in 0..self.length-1
      yield self[i]
    end
    return self
  end
  # Define my_each here
end
