class Game
  
  attr_accessor :self.num_games_started
  
  self.num_games_started = 0
  
  def initialize(name="default")
    @name = name
    @board = [
              [nil, nil, nil],
              [nil, nil, nil],
              [nil, nil, nil]
             ]
    @x_player = nil
    @o_player = nil
    @game_is_over = false
    @@num_games_started += 1
  end
  
  def game_is_over?
    return @game_is_over
  end
  
  def show_board
    @board.each { |row| puts row }
  end
  
end
  
