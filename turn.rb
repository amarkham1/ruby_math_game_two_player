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