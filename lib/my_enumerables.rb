module Enumerable
  # Your code goes here
  def my_each_with_index
    return self unless block_given?
    for i in Range.new(0, self.length - 1)
      yield self[i], i
    end
    self
  end

  def my_select
    return self unless block_given?
    selected = []
    for i in Range.new(0, self.length - 1)
      selected.push(self[i]) if yield self[i]
    end
    selected
  end

  def my_all?
    return false unless block_given?
    cpt = 0
    loop do
      res = yield self[cpt]
      cpt += 1
      break false if res == false
      break true if cpt == self.length - 1
    end
  end

  def my_any?
    return false unless block_given?
    cpt = 0
    loop do
      res = yield self[cpt]
      cpt += 1
      break true if res == true
      break false if cpt == self.length - 1
    end
  end

  def my_none?
    return false unless block_given?
    cpt = 0
    loop do
      res = yield self[cpt]
      cpt += 1
      break false if res == true
      break true if cpt == self.length - 1
    end
  end

  def my_count
    return self.length unless block_given?
    cpt = 0
    for i in Range.new(0, self.length - 1)
      cpt +=1 if yield self[i]
    end
    cpt
  end

  def my_map
    return self unless block_given?
    res = []
    for i in Range.new(0, self.length - 1)
      res.push(yield self[i])
    end
    res
  end

  def my_inject(initial_value)
    return self unless block_given?
    for i in Range.new(0, self.length - 1)
      initial_value = yield initial_value, self[i]
    end
    initial_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return self unless block_given?
    for i in Range.new(0, self.length - 1)
      yield self[i]
    end
    self
  end
end
