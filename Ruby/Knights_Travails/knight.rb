class Node
  attr_accessor :value, :parent

  def initialize (row, col, parent)
    until valid_move([row,col])
      puts "Invalid starting position. Make sure your row and column are >= 0 and <= 7"
      puts "Enter row value: "
      row = gets.chomp
      puts "Enter column value: "
      col = gets.chomp
      row = row.to_i
      col = col.to_i
    end
    @value = [row,col]
    @parent = parent
  end

  def get_moves
    possible_moves  = []
    test_moves = [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]]
    test_moves.each do |x|
      valid = true
      test_row = @value[0] + x[0]
      test_col = @value[1] + x[1]
      if test_row < 0 || test_row > 7 || test_col < 0 || test_col > 7
        valid = false
      else
        possible_moves << Node.new(test_row,test_col, self)
      end
    end
    return possible_moves
  end
end

def knight_moves(start, finish)
  result = []
  currentPass = [Node.new(start[0], start[1], nil)]
  loop do
    nextPass = []
    currentPass.each do |move|
      #p move.class
      #p move
      if move.value == finish
        result << move
        previous = move.parent
        until previous.nil?
          result << previous
          previous = previous.parent
        end
        return result
      else
        move.get_moves.each do |x|
          nextPass << x
        end
      end
    end
    currentPass = nextPass
  end
end

def valid_move(move)
  move.each do |value|
    if value < 0 || value > 7
      return false
    end
  end
  return true
end

def print_moves(moves_list)
  puts "It takes #{moves_list.length-1} moves to get from #{moves_list[0].value} to #{moves_list[-1].value}"
  moves_list.each do |step|
    p step.value
  end
end

print_moves(knight_moves([-1,0],[1,2]).reverse)
print_moves(knight_moves([0,0],[3,3]).reverse)
print_moves(knight_moves([3,3],[4,3]).reverse)


=begin
  attr_accessor :row, :col, :parent, :moves

  def initialize(row, col)
    @row = row
    @col = col
    @moves = []
  end

  def get_moves
    possible_moves = []
    test_moves = [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]]
    test_moves.each do |x|
      valid = true
      test_row = @row + x[0]
      test_col = @col + x[1]
      if test_row < 0 || test_row > 7 || test_col < 0 || test_col > 7
        valid = false
      else
        possible_moves << [test_row,test_col]
      end
    end
    return possible_moves
  end

  def knight_moves(start, to_find)
    output = []
    currentPass = start
    loop do
      nextPass = []
      moves = get_moves
      currentPass.each do |move|
        if move == to_find
          until  @parent.nil?
            output << [@row,@col]


    end
  end
end
=end
