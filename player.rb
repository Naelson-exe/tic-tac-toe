class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def make_move
    puts "#{name}, enter your move (row and column, e.g., '1,2'): "
    gets.chomp.split(',').map(&:to_i)
  end
end
