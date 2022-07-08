require 'game.rb'
require 'player.rb'

def play_tic_tac_toe 
  
  puts "What should we call this game?"
  current_game = Game.new(gets.chomp)
  puts "Who is 'X's? Keep in mind, the 'X' player goes first."
  x_player = Player.new("x", gets.chomp, true)
  puts "And who is 'O's? They'll go second."
  o_player = Player.new("o", gets.chomp, false)
  
  while current_game.is_game_over? == false
    current_game.players.each do |player|
      if player.is_turn?
        player.take_turn
        current_game.check_for_victory
      end
    end
  end
  
  current_game.declare_winner
  
end

play_tic_tac_toe
