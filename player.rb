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