# state: player score
# behaviour: new question and check if answer correct

# player has number and score
# game keeps track of score and has player
# 

# class Player has a number
# class Game has a score

class Game
  STARTING_SCORE = 2

  def initialize
    @player1 = Player.new(STARTING_SCORE)
    @player2 = Player.new(STARTING_SCORE)
    @current_player = @player1
  end

  def start
    while @player1.score > 0 && @player2.score > 0 do
      @new_turn = Turn.new(@current_player)
      if @new_turn.new_question_correct? == false
        @current_player.decrease_score
        puts "#{@current_player.long_name}: Seriously? No!"
      else
        puts "#{@current_player.long_name}: YES! You are correct."
      end
      puts self.current_score
      if @current_player.score > 0
        puts "----- NEW TURN -----"
      end
      @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
    end
    winner = @player1.score == 0 ? @player2 : @player1
    puts "#{winner.long_name} wins with a score of #{winner.score}/#{STARTING_SCORE}"
    puts "----- GAME OVER -----"
    
  end

  def current_score
    "#{@player1.short_name}: #{@player1.score}/#{STARTING_SCORE} vs #{@player2.short_name}: #{@player2.score}/#{STARTING_SCORE}"
  end
end

class Player
  attr_reader :long_name, :short_name, :score
  @@player_count = 0
  def initialize(starting_score)
    @@player_count += 1
    @long_name = "Player #{@@player_count}"
    @short_name = "P#{@@player_count}"
    @score = starting_score
  end

  def decrease_score
    @score -= 1
  end
end

class Turn

  def initialize(player)
    @player = player
  end

  def new_question_correct?
    number1 = rand(1..20)
    number2 = rand(1..20)
    answer = number1 + number2
    puts "#{@player.long_name}: What does #{number1} plus #{number2} equal?"
    print "> "
    player_answer = gets.to_i
    player_answer == answer ? true : false
  end
end

new_game = Game.new
new_game.start

