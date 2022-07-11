class Game

  attr_accessor :name, :board, :players, :game_is_over
  @@num_games_started = 0
  
  def initialize(name="default")
    self.name = name
    self.board = [
              ["___", "___", "___"],
              ["___", "___", "___"],
              ["___", "___", "___"]
             ]
    self.players = []
    self.game_is_over = false
    @@num_games_started += 1
  end
  
  def show_board
    self.board.each { |row| print "#{row}\n" }
  end

  def check_for_victory
    
  end
  
end
