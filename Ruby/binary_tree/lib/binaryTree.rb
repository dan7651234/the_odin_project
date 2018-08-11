require_relative '../node.rb'

class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def build_tree(ary) #appears to traverse entire array and using an insert or add function
                      # to add nodes to the tree

    ary.sort!#cycle through the array
    ary.each do |val|
      if @root.nil?
        @root = Node.new(val,nil,nil,nil)
      else
        insert(val,@root)
      end
    end
  end

  def insert(val,current_node)
    #check if value is less than the root / parent node value
    #if it's less, check if there is a left child node, if not, make child_left equal to the value
    #if the child_left is not empty, make child left the new parent by calling insert on itself
    #add a new node as the child left of that child by calling insert again.
    #make sure to ID the new parent node
    #if the value is greater than the root/parent node, add it to the right using the same method
    #check if child right is nil, if so, add it there, if not add it as a child to that node.

    if val <= current_node.value
      if current_node.child_left.nil?
        current_node.child_left = Node.new(val,current_node,nil,nil)
      else
        insert(val,current_node.child_left)
      end
    else
      if current_node.child_right.nil?
        current_node.child_right = Node.new(val,current_node,nil,nil)
      else
        insert(val,current_node.child_right)
      end
    end

    #puts "Parent = " + current_node.parent.value.to_s unless current_node.parent.nil?
    #puts "Value = " + current_node.value.to_s
    #puts "Child Left = " + current_node.child_left.value.to_s unless current_node.child_left.nil?
    #puts "Child Right = " + current_node.child_right.value.to_s unless current_node.child_right.nil?

  end

  def breadth_first_search(to_find)
    currentPass = [@root]
    loop do
      nextPass = []
      currentPass.each do |x|
        puts "X value: " + x.value.to_s
        if x.nil?
          next
        else
          if x.value == to_find
            return x
          elsif x.value > to_find
            return nil
          else
            nextPass << x.child_left unless x.child_left.nil?
            nextPass << x.child_right unless x.child_right.nil?
          end
        end
      end
      #puts "nextPass = " + nextPass.to_s
      currentPass = nextPass
    break if !nextPass.any?
    end
    return nil
  end

  def depth_first_search(to_find)
    path = []
    done = false
    current = @root

    while (!done)
      if current.nil? == false
        if current.value == to_find
          return current
        else
          path << current
          current = current.child_left
        end
      elsif path.length > 0
        current = path.pop
        current = current.child_right
      else
        done = true
      end
    end #close while
    return "Value not found"
  end #close depth_first_search

  def dfs_rec (to_find, current_node)
    #base case
    if current_node.nil?
      return 0
    elsif current_node.value == to_find
      return current_node
    end

    #recursive calls
    result = dfs_rec(to_find, current_node.child_left)
    if result.is_a?(Node)
      return result
    else
      result = dfs_rec(to_find, current_node.child_right)
      if result.is_a?(Node)
        return result
      else
        return 0
      end
    end
  end

end

newTree = BinaryTree.new
newTree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
#found = newTree.breadth_first_search(68)
#puts "Breadth first search result: " + found.value.to_s

located = newTree.depth_first_search(23)
puts "Depth first search result: " + located.value.to_s

observed = newTree.dfs_rec(23, newTree.root)
puts "Recursive depth first search result: " + observed.value.to_s

if located == observed
  puts "They are the same node"
end
