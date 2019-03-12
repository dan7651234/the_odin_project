class Player
  attr_accessor :piece
  def initialize(piece)
    @piece = piece
  end

  def play
    return @piece
  end
end
