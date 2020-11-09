class Game
  STARTING_SCORE = 3

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
    self.game_over(winner)
    
  end

  protected

  def game_over(winner)
    puts "#{winner.long_name} wins with a score of #{winner.score}/#{STARTING_SCORE}"
    puts "----- GAME OVER -----"
  end

  def current_score
    "#{@player1.short_name}: #{@player1.score}/#{STARTING_SCORE} vs #{@player2.short_name}: #{@player2.score}/#{STARTING_SCORE}"
  end
end