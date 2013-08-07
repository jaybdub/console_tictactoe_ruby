class Referee
  def initialize 
    @turn = :X
  end
  def update_turn
    #just alternate turn, we wont do random starts
    case @turn
    when :O
      @turn = :X
    when :X
      @turn = :O
    else
      @turn = :X
    end
  end
  def get_turn
    return @turn
  end
  def check_outcome(board)
  #check for row match
    row_outcome = self.check_rows_winner(board)
    return row_outcome if row_outcome!=:N
  #check for column match
    col_outcome = self.check_columns_winner(board)
    return col_outcome if col_outcome!=:N
  #check for diagnal match
    pos_diag_outcome = self.check_line_winner(board.get_diag_pos_string)
    neg_diag_outcome = self.check_line_winner(board.get_diag_neg_string)
    return pos_diag_outcome if pos_diag_outcome!=:N
    return neg_diag_outcome if neg_diag_outcome!=:N
  #if we've made it here there's no winner yet
    return :C if board.is_filled#if all spots are taken return cats
    return :N #otherwise lets keep going
  end
  def is_board_valid(board)
    return true if (board.num_X-board.num_O).abs <= 1
    return false
  end
  def check_rows_winner(board)
    $i=0
  #iterate through each row
    while $i <= board.get_board_size do
      $i+=1
      line = board.get_row_string($i) #Get the row as a string
      outcome = self.check_line_winner(line) #check the outcome
      return outcome if outcome!=:N # return winner if exists
    end
    return :N #default no winner
  end
  def check_columns_winner(board)
    $i=0
    while $i <= board.get_board_size do
      $i+=1
      line = board.get_column_string($i) #Get the row as a string
      outcome = self.check_line_winner(line) #check the outcome
      return outcome if outcome!=:N #return winner if exists
    end
    return :N #default no winner
  end
  def check_line_winner(line_string)
    return :X if line_string.downcase=="xxx"
    return :O if line_string.downcase=="ooo"
    return :N
  end
end
