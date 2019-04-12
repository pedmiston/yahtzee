class Yahtzee
  SINGLES = {"ones" => 1, "twos" => 2, "threes" => 3, "fours" => 4, "fives" => 5, "sixes" => 6}

  def self.score_by_rule(dice, rule)
    if SINGLES.include?(rule)
      dice
        .select{|die| die == SINGLES[rule]}
        .sum()
    elsif rule == "pair"
      [1, 2, 3, 4, 5, 6].map do |die|
        if dice.count(die) >= 2
          die * 2
        end
      end.compact.pop
    else
      dice.sum()
    end
  end

end