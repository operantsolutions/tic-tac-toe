class Player

  attr_accessor :piece, :name, :is_turn

  def initialize(piece, name, is_turn)
    self.piece = piece
    self.name = name
    self.is_turn = is_turn
  end

end
