class Yahtzee
  SINGLES = {"ones" => 1, "twos" => 2}

  def self.score_by_rule(dice, rule)
    if SINGLES.include?(rule)
      dice
        .select{|die| die == SINGLES[rule]}
        .sum()
    else
      dice.sum()
    end
  end

end