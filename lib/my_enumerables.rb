module Enumerable
  # Your code goes here
  def my_all?(&block)
    my_each { |item| return false unless block.call(item) }
    true
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
