class Yahtzee
  SINGLES = {"ones" => 1, "twos" => 2, "threes" => 3, "fours" => 4, "fives" => 5, "sixes" => 6}
  DUPLICATES = {"pair" => 2, "three_of_a_kind" => 3, "four_of_a_kind" => 4}

  def self.score_by_rule(dice, rule)
    if SINGLES.include?(rule)
      dice
        .select{|die| die == SINGLES[rule]}
        .sum()
    elsif DUPLICATES.include?(rule)
      get_multiples(dice, DUPLICATES[rule]).pop
    elsif rule == "two_pair"
      get_multiples(dice, 2).sum
    elsif rule == "Yahtzee"
      dice.uniq.length == 1 ? 50 : 0
    elsif rule == "full_house"
      dice.uniq.length == 2 ? dice.sum : 0
    else
      dice.sum()
    end
  end

  def self.get_multiples(dice, n)
    [1, 2, 3, 4, 5, 6].map do |die|
      if dice.count(die) >= n
        die * n
      end
    end.compact
  end

end