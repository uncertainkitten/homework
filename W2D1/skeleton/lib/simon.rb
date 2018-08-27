class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn while game_over == false

    if game_over == true
      game_over_message
      reset_game
    end
  end

  def take_turn
    show_sequence
    require_sequence
    if game_over == false
      @sequence_length += 1
      round_success_message
    end
  end

  def show_sequence
    add_random_color
    puts @seq
    sleep 1
  end

  def require_sequence
    system "clear"
    print "What was the sequence? (ex. red, blue, red)"
    input = gets.chomp
    parse_input(input)
  end

  def parse_input(input)
    tester = input.split(", ")
    if tester == @seq
      @game_over = false
    else
      @game_over = true
    end
  end

  def add_random_color
    seq.push(COLORS.sample)
  end

  def round_success_message
    puts "You're correct!  Next round is #{@sequence_length} colors!"
  end

  def game_over_message
    puts "Wrong!  You lose!  You got to #{@sequence_length}"
  end

  def reset_game
    @game_over, @sequence_length, @seq = false, 1, []
  end
end
