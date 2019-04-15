class Yahtzee
  SINGLES = {"ones" => 1, "twos" => 2, "threes" => 3, "fours" => 4, "fives" => 5, "sixes" => 6}
  DUPLICATES = {"pair" => 2, "three_of_a_kind" => 3, "four_of_a_kind" => 4}

  def score_by_rule(dice, rule)
    case rule
    when -> (rule) { SINGLES.include?(rule) }
      dice
        .select{|die| die == SINGLES[rule]}
        .sum()
    when -> (rule) { DUPLICATES.include?(rule) }
        get_multiples(dice, DUPLICATES[rule]).pop
    when "two_pair"
        get_multiples(dice, 2).sum
    when "Yahtzee"
        dice.uniq.length == 1 ? 50 : 0
    when "full_house"
        if dice.uniq.length == 2 && has_three_of_a_kind(dice)
          dice.sum
        else
          0
        end
    when "small_straight"
        dice.sort() == [1, 2, 3, 4, 5] ? dice.sum : 0
    when "large_straight"
        dice.sort() == [2, 3, 4, 5, 6] ? dice.sum : 0
    else
        dice.sum()
    end
  end

  private

  def get_multiples(dice, n)
    [1, 2, 3, 4, 5, 6].map do |die|
      if dice.count(die) >= n
        die * n
      end
    end.compact
  end

  def has_three_of_a_kind(dice)
    [1, 2, 3, 4, 5, 6].map do |die|
      if dice.count(die) == 3
        return true
      end
    end
    false
  end

end
