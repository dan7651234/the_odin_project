require_relative 'node.rb'

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    newNode = Node.new
    newNode.value = value
    if @head == nil
      @head = newNode
      @tail = newNode

    else @head == @tail
      @tail.next_node = newNode
      @tail = newNode

    end
    @size = @size + 1
=begin
    puts "Head = " + @head.value.to_s
    puts "Tail = " + @tail.value.to_s
    puts "newNode = " + newNode.value.to_s
    puts ""
=end
  end

  def prepend(value)
    newNode = Node.new
    newNode.value = value
    if @head == nil
      @head = newNode
      @tail = newNode
    else
      newNode.next_node = @head
      @head = newNode
    end
    @size = @size + 1
=begin
    puts "Head = " + @head.value.to_s
    puts "Tail = " + @tail.value.to_s
    puts "newNode = " + newNode.value.to_s
    puts "afternew = " + newNode.next_node.value.to_s
    puts ""
=end
  end

  def at(index)
    i = 0
    select = @head
      while i <= index
        if i == index
          return select
        else
          select = select.next_node
          i = i + 1
        end
      end
  end

  #removes last node from the linked list
  def pop
    i = 0
    select = @head
    while i <= @size - 1
        if i == @size - 2
          select.next_node = nil
          @tail = select
        elsif @size == 1
          @head = nil
          @tail = nil
        else
          select = select.next_node
        end
        i = i + 1
      end
      @size = @size - 1
    end

    def contains?(data)
      i = 0
      select = @head
      while i <= @size - 1
        if select.value == data
          return true
        else
          select = select.next_node
        end
        i = i + 1
      end
      return false
    end

    #returns index of first node containing parameter value
    def find(data)
      i = 0
      select = @head
      while i <= @size - 1
        if select.value == data
          return i
        else
          select = select.next_node
          i = i + 1
        end
      end
    end

    def to_s
      result = ""
      #i = 0
      select = @head
      until select == @tail
        result += "( #{select.value} ) -> "
        select = select.next_node
        #i = i + 1
      end
      result += "( #{@tail.value} ) -> nil"
      return result
    end

end

newList = LinkedList.new

newList.append(11)
#puts newList.size
newList.append(9)
newList.append(17)
newList.append(30)
#puts newList.size

newList.prepend("fly")
newList.prepend("Eagles")
newList.prepend("Fly")
#puts newList.size
#select = newList.at(5)
#puts "Selection = " + select.value.to_s
puts "Size = " + newList.size.to_s
puts "Tail = " + newList.tail.value.to_s
newList.pop
puts "Size = " + newList.size.to_s
puts "Tail = " + newList.tail.value.to_s
puts "Contains 17? " + newList.contains?(17).to_s + " found at index: " + newList.find(17).to_s
puts "Contains 88? " + newList.contains?(88).to_s + " found at index: " + newList.find(88).to_s
puts newList.to_s
