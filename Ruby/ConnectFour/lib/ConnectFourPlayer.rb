class ConnectFourPlayer
  attr_accessor :piece, :name
  @@count = 0

  def initialize(piece, name)
    @piece = piece
    @name = name
    @@count = @@count + 1
  end

  def get_piece
    return @piece
  end

end
