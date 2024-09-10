class TicTacToe
  def wining_conmibations
    wining_conmibations = [[:a1, :a2, :a3], [:b1, :b2, :b3], [:c1, :c2, :c3], [:a1, :b1, :c1], [:a2, :b2, :c2], [:a3, :b3, :c3], [:a1, :b2, :c3], [:c1, :b2, :a3]]
  end
  def initialize

    @board = {
      a1: '-',
      a2: '-',
      a3: '-',
      b1: '-',
      b2: '-',
      b3: '-',
      c1: '-',
      c2: '-',
      c3: '-',
    }

  end

  def display_board
    puts "
     | 1 | 2 | 3 |
    a| #{@board[:a1]} | #{@board[:a2]} | #{@board[:a3]} |
    b| #{@board[:b1]} | #{@board[:b2]} | #{@board[:b3]} |
    c| #{@board[:c1]} | #{@board[:c2]} | #{@board[:c3]} |
    "
  end

  def position_taken?(index)
    @board[index.to_sym] != '-'
  end

  def turn_count
    @turn_count = @board.count{ |k,v| v != '-'} + 1
  end

  def player
    @turn_count.even? ? "O" : 'X'
  end

  def turn
    turn_count
    puts @turn_count.even? ? 'Player 2 Chose a position: ' : 'Player 1 chose a position: '
    input = gets.chomp
    movement = input.to_sym
    if position_taken?(movement) || @board[movement].nil?
      puts "Invalid movement!"
    else
      move(movement)
    end
  end

  def move(index)
    @board[index] = player
  end

  def draw
    @board.all? { |k,v| v != '-' }
  end

  def won
    wining_conmibations.detect do |arr|
    position_taken?(arr[0]) &&
    @board[arr[0]] == @board[arr[1]] &&
    @board[arr[0]] == @board[arr[2]]
    end
  end

  def over?
    if won
      system('cls')
      display_board
      puts @turn_count.even? ? 'Player 2 wins' : 'Player 1 wins'
      return true
    elsif draw
      system('cls')
      display_board
      puts "It's a draw"
      return true
    else
      false
    end
  end

  def play
    until over?
      system('cls')
      display_board
      turn
    end
  end
end

# game = TicTacToe.new

# game.play