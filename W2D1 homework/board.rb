class Board
  attr_accessor :cups
  
  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2 
    @cup_arr = Array.new(14) { Array.new } 
    place_stones
  end

  def place_stones
    @cup_arr.each_with_index do |cup, i|
      next if i == 6 || i == 13
        4.times do 
          cup << stone
        end    
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12
      raise "Invalid starting cup"
    elsif @cup_arr[start_pos].empty? 
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    stone_map = @cup_arr[start_pos]
    @cup_arr[start_pos] = []
    idx = start_pos   

    whidxle !stone_map.empty?
      idx += 1
      idx = 0 if idx > 13
      if idx == 6
        @cup_arr[6] << stone_map.shift if current_player_name == @name1
      elsif idx == 13
        @cup_arr[13] << stone_map.shift if current_player_name == @name2
      else 
        @cup_arr[idx] << stone_map.shift
      end                  
    end

    self.render
    self.next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      prompt
    elsif @cup_arr[ending_cup_idx].length > 1
      return ending_cup_idx 
    elsif @cup_arr[ending_cup_idx].length == 1
      switch
    end
    
  end

  def render
    print "      #{@cup_arr[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cup_arr[13].count} -------------------------- #{@cup_arr[6].count}"
    print "      #{@cup_arr.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cup_arr[0..6].each do |cup|
      if cup.length >= 1
        return false
      end
      return true
    end

    @cup_arr[7..12].each do |cup|
      if cup.length >= 1
        return false
      end
      return true
    end
  end

  def winner
    score1 = @cup_arr[6].length 
    score2 = @cup_arr[13].length 

    if score1 == score2 
      draw 
    elsif score1 > score2 
      @name1
    else 
      @name2
    end
  end
end
