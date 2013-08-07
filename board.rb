class Board
  def initialize
    @grid = Hash[ 1 => :n, 2 => :n, 3 => :n,
               4 => :n, 5 => :n, 6 => :n,
               7 => :n, 8 => :n, 9 => :n]
    @board_size = 3
  end
  def place_X(slot)
    return false if !(1..9).member?(slot) #return false and skip placement if slot is not on board
    @grid[slot] = :O if @grid[slot]==:n #place X if slot is unoccupied
    return true if @grid[slot] = :X #return true if X was placed
    return false #return false if unsucessful
  end
  def place_O(slot)
    return false if !(1..9).member?(slot) #return false and skip placement if slot is not on board
    @grid[slot] = :O if @grid[slot]==:n #place X if slot is unoccupied
    return true if @grid[slot] = :O #return true if X was placed
    return false #return false if unsucessful
  end
  def print_board
    puts ""
    #prints the board key if the slot is unoccupied (:n) and prints the value if it is occupied
    #appends a space after each character, or a newline if we've reached the end of the board
    @grid.each {|key, value| print (value==:n ? key.to_s : value.to_s)+(key%@board_size==0 ? "\n" : " ")}
    puts""
  end
  def get_row_string(row)
    row = @grid.select {|key,value| (key <= row*@board_size)&&(key > row*@board_size-@board_size)}
    return row.values.join
  end
  def get_column_string(column)
    column = @grid.select {|key,value| ((key-1) % @board_size == (column - 1))}
    return column.values.join
  end
  def get_diag_pos_string
    diag = @grid.select {|key,value| (key % (@board_size+1)==1)}
    return diag.values.join
  end
  def get_diag_neg_string
    diag = @grid.select {|key,value| (key % (@board_size-1)==1)&&(key!=@board_size*@board_size)&&(key!=1)}
    return diag.values.join
  end
  def reset_board
    @grid = Hash[ 1 => :n, 2 => :n, 3 => :n,
               4 => :n, 5 => :n, 6 => :n,
               7 => :n, 8 => :n, 9 => :n]
  end
  def get_board_size
    return @board_size
  end
  def is_filled
    return !@grid.values.member?(:n)
  end
  def num_X
    return (@grid.select {|key,value| value==:X}).length
  end
  def num_O
    return (@grid.select {|key,value| value==:O}).length
  end
  def num_N
    return (@grid.select {|key,value| value==:n}).length
  end
  private
    
    
end
