class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = [[],[],[],[],[],[],[:store1],[],[],[],[],[],[],[:store2]]
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup,idx|
      if cup.empty?
        cups[idx] = [:stone, :stone, :stone, :stone]
      else
        cups[idx] = []
      end
    end
  end

  def valid_move?(start_pos)
    begin
      raise InvalidMove, "Invalid starting cup" if (start_pos < 0) || (start_pos > 12)
      raise InvalidMove, "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    handful = []
    if start_pos < 6 && start_pos > 0
      act_pos = start_pos - 1
    else
      act_pos = start_pos
    end


    empty_cup = @cups[act_pos]
    empty_cup.length.times do |i|
      handful << empty_cup.pop
    end

    dist = (act_pos + 1)
    until handful.empty?
      if current_player_name == @name1 && dist == 13
        dist = (dist + 1) % 13 unless handful.empty?
      elsif current_player_name == @name2 && dist == 6
        dist = (dist + 1) unless handful.empty?
      elsif dist == 13
        @cups[dist] << handful.pop
        dist = (dist + 1) % 13 unless handful.empty?
      else
        @cups[dist] << handful.pop
        dist = (dist + 1) unless handful.empty?
      end
    end

    render
    next_turn(dist)


  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length < 2
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1 = @cups[0..5]
    side2 = @cups[7..12]

    if side1.all? {|el| el.empty?} || side2.all? {|el| el.empty?}
      return true
    else
      return false
    end

  end

  def winner
    if @cups[6].length == @cups[13].length
      :draw
    elsif @cups[6].length > @cups[13].length
      @name1
    else
      @name2
    end
  end
end

class InvalidMove < RuntimeError; end
