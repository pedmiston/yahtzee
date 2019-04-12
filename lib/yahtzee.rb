class Yahtzee
  SINGLES = {"ones" => 1, "twos" => 2}

  def self.score_by_rule(dice, rule)
    if SINGLES.include?(rule)
      total = 0
      dice.each do |die|
        if die == SINGLES[rule]
          total += SINGLES[rule]
        end
      end
      total
    else
      # dice.sum()
      sum_dice(dice)
    end
  end

  def self.sum_dice(dice)
    dice.sum()
  end

end