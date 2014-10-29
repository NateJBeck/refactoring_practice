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
    while another_round?
      cheat_or_not
      display_round_number
      make_moves
      display_moves
      puts judge_result
      show_results
    end
  end

  private

  def cheat_or_not
    puts "1) Computer always wins 2) Computer Never Wins"
    input = gets.chomp
    if input == "1"
      computer_wins
    elsif input == "2"
      computer_loses
    else
      choose_one
    end
  end

  def show_results
    if judge_result == "Player wins!"
      @player_wins += 1
    end
    puts
    puts "You've won #{(@player_wins*100)/@round}% of games thus far"
  end

  def display_round_number
    puts "--- Round #{@round} ---"
  end

  def make_moves
    @player_move = @player.make_a_move
    @computer_move = @computer.cheat_but_lose(@player_move)
  end

  def display_moves
    show_player_move
    show_computer_move
  end

  def show_player_move
    puts "Player went with #{@player_move}"
  end

  def show_computer_move
    puts "Computer went with #{@computer_move}"
  end

  def judge_result
    judge = Judge.new(@player_move, @computer_move)
    judge.announce_winner
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
