require './game.rb'
require './player.rb'
require 'pry-byebug'

def place_piece(piece, location, game)
  case location
  when "top-left"
    game.board[0][0] = piece
  when "top-middle"
    game.board[0][1] = piece
  when "top-right"
    game.board[0][2] = piece
  when "middle-left"
    game.board[1][0] = piece
  when "middle-middle"
    game.board[1][1] = piece
  when "middle-right"
    game.board[1][2] = piece
  when "bottom-left"
    game.board[2][0] = piece
  when "bottom-middle"
    game.board[2][1] = piece
  when "bottom-right"
    game.board[2][2] = piece
  else
    puts "PLACEMENT ERROR"
  end
end

def take_turn(player, game)
  game.show_board
  puts "It is #{player.name}'s turn. Where would you like to put your piece?"
  place_piece(player.piece, gets.chomp, game)
end

def play_tic_tac_toe 
  
  puts "What should we call this game?"
  current_game = Game.new(gets.chomp)
  puts "Who is 'X's? Keep in mind, the 'X' player goes first."
  x_player = Player.new("x", gets.chomp, true)
  current_game.players.push(x_player)
  puts "And who is 'O's? They'll go second."
  o_player = Player.new("o", gets.chomp, false)
  current_game.players.push(o_player)
  binding.pry
  
  while current_game.game_is_over == false
    current_game.players.each do |player|
      if player.is_turn
        take_turn(player, current_game)
        current_game.check_for_victory
        player.is_turn = false
        case player.piece
        when "x"
          o_player.is_turn = true
        when "o"
          x_player.is_turn = true
        else puts "TURN ERROR"
        end
      end
    end
  end
  
  current_game.declare_winner
  
end

play_tic_tac_toe
