require_relative 'player'
require_relative 'board'

class Game
  def initialize
    @board = Board.new
    @players = []
  end

  def setup
    puts 'Welcome to Tic Tac Toe!'
    2.times do |i|
      puts "Enter name for Player #{i + 1}:"
      name = gets.chomp
      marker = i.zero? ? 'X' : 'O'
      @players << Player.new(name, marker)
    end
    @current_player_index = 0
  end

  def play
    setup
    last_player = nil
    until game_over?(last_player)
      clear_console
      puts ''
      @board.display
      puts ''
      last_player = @players[@current_player_index]
      make_move(last_player)
      @current_player_index = (@current_player_index + 1) % 2
    end
    clear_console
    conclude_game(last_player)
  end

  private

  def make_move(player)
    position = nil
    loop do
      position = player.make_move
      break if @board.valid_move?(*position)

      puts 'Invalid move. Try again!'
    end
    @board.update(position, player.marker)
  end

  def game_over?(last_player)
    last_player && @board.winner?(last_player.marker) || @board.full?
  end

  def conclude_game(last_player)
    puts ''
    @board.display
    puts ''
    if last_player && @board.winner?(last_player.marker)
      puts "#{last_player.name} wins!"
    else
      puts "It's a draw!"
    end
  end

  def clear_console
    system('clear') || system('cls')
  end
end
