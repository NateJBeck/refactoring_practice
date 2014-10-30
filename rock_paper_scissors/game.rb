require "./player.rb"
require "./computer.rb"
require "./judge.rb"

class Game
  CHOICES = ["r", "p", "s"]
  COMBOS = {"R" => "P", "P" => "S", "S" => "R"}

  def initialize
    @player = Player.new
    @computer = Computer.new
    @round = 0
    @player_wins = 0
  end

  def play
    cheat_or_not
    while another_round?
      display_round_number
      make_moves
      puts judge_result
      print_player_win_percentage
    end
  end

  private

  def show_moves
    puts "Player went with #{@player_move}"
    puts "Computer went with #{@computer_move}"
  end

  def cheat_or_not
    puts "Want the computer to cheat or not?"
    puts "1) NO"
    puts "2) Computer ALWAYS wins"
    puts "3) Computer NEVER wins"
    puts "4) RANDOM MODE"
    puts "==>> "
    @input = gets.chomp
  end

  def print_player_win_percentage
    puts
    @player_wins = @judge.player_wins
    puts "You've won #{(@player_wins*100)/@round}% of games thus far"
  end

  def display_round_number
    puts "--- Round #{@round} ---"
  end

  def make_moves
    if random_mode?
      @input = rand(1..3)
    end

    @player_move = @player.make_a_move
    computer_make_a_move
    show_moves
  end

  def computer_make_a_move
    if @input == "1"
      @computer_move = @computer.make_a_move
    elsif @input == "2"
      @computer_move = @computer.cheat_and_win(@player_move)
    elsif @input == "3"
      @computer_move = @computer.cheat_but_lose(@player_move)
    end
  end

  def random_mode?
    @input == "4"
  end

  def judge_result
    @judge = Judge.new(@player_move, @computer_move)
    @judge.announce_winner
  end

  def another_round?
    puts "Enter Y to play a round, N to quit"
    if gets.chomp == "Y"
      @round += 1
      true
    end
  end
end

game = Game.new
game.play
