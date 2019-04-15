class Yahtzee
  SINGLES = {"ones" => 1, "twos" => 2, "threes" => 3, "fours" => 4, "fives" => 5, "sixes" => 6}
  DUPLICATES = {"pair" => 2, "three_of_a_kind" => 3, "four_of_a_kind" => 4}

  def score_by_rule(dice, rule)
    case rule
    when -> (rule) { SINGLES.include?(rule) }
      singles(dice, SINGLES[rule])
    when -> (rule) { DUPLICATES.include?(rule) }
      duplicates(dice, DUPLICATES[rule])
    when "two_pair"
      two_pair(dice)
    when "Yahtzee"
      yahtzee(dice)
    when "full_house"
      full_house(dice)
    when "small_straight"
      small_straight(dice)
    when "large_straight"
      large_straight(dice)
    when "chance"
      chance(dice)
    else
      raise "don't know how to score by rule #{rule}"
    end
  end

  private

  def singles(dice, n)
    dice
      .select{|die| die == n}
      .sum()
  end

  def duplicates(dice, n)
    get_multiples(dice, n).pop
  end

  def two_pair(dice)
    get_multiples(dice, 2).sum
  end

  def yahtzee(dice)
    dice.uniq.length == 1 ? 50 : 0
  end

  def small_straight(dice)
    dice.sort() == [1, 2, 3, 4, 5] ? dice.sum : 0
  end

  def large_straight(dice)
    dice.sort() == [2, 3, 4, 5, 6] ? dice.sum : 0
  end

  def full_house(dice)
    if dice.uniq.length == 2 && has_three_of_a_kind(dice)
      dice.sum
    else
      0
    end
  end

  def chance(dice)
    dice.sum
  end

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
