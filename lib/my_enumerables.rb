module Enumerable
  # Your code goes here
  def my_all?(&block)
    my_each { |item| return false unless block.call(item) }
    true
  end

  def my_any?(&block)
    my_each { |item| return true if block.call(item) }
    false
  end

  def my_count(&block)
    count = 0
    if block_given?
      my_each { |i| count += 1 if block.call(i) }
    else
      my_each { count += 1 }
    end
    count
  end

  def my_each_with_index(&block)
    idx = 0
    my_each do |val|
      block.call(val, idx)
      idx += 1
    end
    self
  end

  def my_inject(initial = 0, &block)
    my_each { |val| initial = block.call(initial, val) }
    initial
  end

  def my_map(&block)
    res = []
    my_each { |val| res.append(block.call(val)) }
    res
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    length.times { |i| block.call self[i] }
    self
  end
end
