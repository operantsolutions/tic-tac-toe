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
    pieces = ["x", "o"]
    directions = ["d1", "d2", "v", "h"]
    pieces.each do |piece|
      self.board.each_with_index do |row, row_index|
        row.each_with_index do |square, square_index|
          adjacent_squares = {
                              :nw => self.board.dig(row_index-1, square_index-1), :n => self.board.dig(row_index-1, square_index), :ne => self.board.dig(row_index-1, square_index+1),
                              :w => self.board.dig(row_index, square_index-1), :e => self.board.dig(row_index, square_index+1),
                              :sw => self.board.dig(row_index+1, square_index-1), :s => self.board.dig(row_index+1, square_index), :se => self.board.dig(row_index+1, square_index+1)
                              }
          if square == piece
            directions.each do |direction|
              pieces_in_a_row = 1
              case direction
              when "d1"
                adjacent_squares[:nw] == piece ? pieces_in_a_row += 1 : pieces_in_a_row = pieces_in_a_row
                adjacent_squares[:se] == piece ? pieces_in_a_row += 1 : pieces_in_a_row = pieces_in_a_row
              when "d2"
                adjacent_squares[:ne] == piece ? pieces_in_a_row += 1 : pieces_in_a_row = pieces_in_a_row
                adjacent_squares[:sw] == piece ? pieces_in_a_row += 1 : pieces_in_a_row = pieces_in_a_row
              when "v"
                adjacent_squares[:n] == piece ? pieces_in_a_row += 1 : pieces_in_a_row = pieces_in_a_row
                adjacent_squares[:s] == piece ? pieces_in_a_row += 1 : pieces_in_a_row = pieces_in_a_row
              when "h"
                adjacent_squares[:w] == piece ? pieces_in_a_row += 1 : pieces_in_a_row = pieces_in_a_row
                adjacent_squares[:e] == piece ? pieces_in_a_row += 1 : pieces_in_a_row = pieces_in_a_row
              else
                puts "DIRECTION ERROR"
              end 
              if pieces_in_a_row == 3
                self.game_is_over = true
                puts "The #{piece} player wins!"
              elsif pieces_in_a_row > 3
                puts "MORE THAN 3 IN A ROW ERROR"
              end
            end
          end
        end
      end
    end
  end
  
end
