class Node
  attr_accessor :value, :parent, :child_left, :child_right

  def initialize(value, parent, child_left, child_right)
    @value = value
    @parent = parent
    @child_left = child_left
    @child_right = child_right
  end


end
