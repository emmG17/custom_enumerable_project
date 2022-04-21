module Enumerable
  # Your code goes here
  def my_all?(&block)
    my_each { |item| return false unless block.call(item) } if block_given?
    true
  end

  def my_any?(&block)
    my_each { |item| return true if block.call(item) } if block_given?
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
    if block_given?
      my_each do |val|
        block.call(val, idx)
        idx += 1
      end
    end
    self
  end

  def my_inject(initial = 0, &block)
    my_each { |val| initial = block.call(initial, val) } if block_given?
    initial
  end

  def my_map(&block)
    res = []
    my_each { |val| res.append(block.call(val)) } if block_given?
    res
  end

  def my_none?(&block)
    my_each { |val| return false if block.call(val) } if block_given?
    true
  end

  def my_select(&block)
    res = []
    my_each { |val| res.append(val) if block.call(val) } if block_given?
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
    length.times { |i| block.call self[i] } if block_given?
    self
  end
end
