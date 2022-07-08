class Game

  @@num_games_started = 0
  
  def initialize(name="default")
    @name = name
    @board = [
              ["___", "___", "___"],
              ["___", "___", "___"],
              ["___", "___", "___"]
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
    @board.each { |row| print "#{row}\n" }
  end
  
end
