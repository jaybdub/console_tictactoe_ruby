require './board'
require './referee.rb'
require './board.rb'
class Application
  def initialize
    @score = {:X => 0,:O => 0, :C => 0}
    @board = Board.new
    @ref = Referee.new
  end
  def menu
    self.clear_screen
    #prompt user for input
    self.print_menu
    choice = gets.strip.downcase
    self.process_menu_choice(choice)
  end
  def process_menu_choice(choice)
    case choice
    when 'n'
      self.new_game
    when 's'
      #if show_score input
      self.show_score
    when 'q'
      #if quit input
      self.quit
    else
      #recall menu
      puts "sorry i didn't understand that"
      self.menu
    end
  end
  def print_menu
    puts "(n)ew game"
    puts "(s)core"
    puts "(q)uit"
    print "tictactoe > "
  end
  def new_game
    #reset_board
    puts "okay, a new game it is"
    @board.reset_board
    self.take_turn
    #initialize turn
    #self.initialize_turn
    #take_turn
  end
  def clear_screen
    puts "\e[H\e[2J"
  end
  def take_turn
    self.clear_screen
    @board.print_board
    self.prompt_player(@ref.get_turn)
    move = gets.strip.to_i
    self.take_turn if !self.make_move(move)#take a turn if our move failed
    outcome = @ref.check_outcome(@board)
    self.process_outcome(outcome)
    #prompt user @turn
    #get placement
      #if invalid self.take_turn
    #print board
    #check outcome
    #if finished 
      #print outcome / update score
      #show menu
    #else 
      #increment turn
      #self.take_turn
  end
  def hold
    puts "\nhit enter to continue"
    gets
  end
  def process_outcome(outcome)
    case outcome
    when :X # X wins
      self.clear_screen
      @board.print_board
      puts "player X WINS!!"
      puts ""
      @score[:X] += 1
      self.hold
      self.menu
    when :O # O wins
      self.clear_screen
      puts "player O is the WINNAH!"
      @score[:O] += 1
      self.hold
      self.menu
    when :C #a cats
      puts "cats game!" if @score[:C] < 3
      puts "another fucking cats game.. tictactoe man.." if @score[:C]>= 3
      @score[:C]+=1
      self.hold
      self.menu
    when :N #games not over
      @ref.update_turn
      self.take_turn
    end
  end
  def make_move(move)
    case @ref.get_turn
    when :X
      if !@board.place_X(move)
        puts "you can't do that silly"
        return false
      end
      return true
    when :O
      if !@board.place_O(move)
        puts "you can't do that silly"
        return false
      end
      return true
    else
      puts "somethings gone terribly wrong"
      return false
    end
  end
  def prompt_player(player)
    puts "what'll it be #{player}?"
    print "player_#{player} > "
  end
  def show_score
    self.clear_screen
    puts "SCORE BOARD: "
    puts ""
    puts "X: #{@score[:X]}"
    puts "O: #{@score[:O]}"
    puts "CATS: #{@score[:C]}"
    puts ""
    self.hold
    self.menu
  end
  def update_score
  
  end
  def quit
    self.clear_screen
    puts "buhbye!"
  end
end
