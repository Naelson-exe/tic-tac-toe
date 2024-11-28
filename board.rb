class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, ' ') }
  end

  def display
    @grid.each do |row|
      puts row.map { |cell| cell.empty? ? '_' : cell }.join(' | ')
    end
  end

  def update(position, marker)
    row, col = position
    @grid[row][col] = marker if valid_move?(row, col)
  end

  def valid_move?(row, col)
    (0..2).cover?(row) && (0..2).cover?(col) && @grid[row][col] == ' '
  end

  def full?
    @grid.flatten.none? { |cell| cell == ' ' }
  end

  def winner?(marker)
    # Check rows, columns, and diagonals
    win_lines = @grid + @grid.transpose + diagonals
    win_lines.any? { |line| line.all?(marker) }
  end

  private

  def diagonals
    [
      [@grid[0][0], @grid[1][1], @grid[2][2]],
      [@grid[0][2], @grid[1][1], @grid[2][0]]
    ]
  end
end
