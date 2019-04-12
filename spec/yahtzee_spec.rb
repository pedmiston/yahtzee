require_relative "../lib/yahtzee"

describe "Yahtzee" do
  it "scores chance of 15" do
    dice = [1, 2, 3, 4, 5]
    result = Yahtzee.score_by_rule(dice, "chance")
    expect(result).to eq(15)
  end

  it "scores chance of 5" do
    dice = [1, 1, 1, 1, 1]
    result = Yahtzee.score_by_rule(dice, "chance")
    expect(result).to eq(5)
  end

  it "scores ones" do
    dice = [1, 1, 1, 5, 4]
    result = Yahtzee.score_by_rule(dice, "ones")
    expect(result).to eq(3)
  end

  it "scores twos" do
    dice = [1, 1, 2, 2, 2]
    result = Yahtzee.score_by_rule(dice, "twos")
    expect(result).to eq(6)
  end

  it "scores threes" do
    dice = [1, 1, 1, 3, 3]
    result = Yahtzee.score_by_rule(dice, "threes")
    expect(result).to eq(6)
  end

  it "scores fours" do
    dice = [4, 4, 4, 4, 5]
    result = Yahtzee.score_by_rule(dice, "fours")
    expect(result).to eq(16)
  end

  it "scores fives" do
    dice = [5, 1, 1, 1, 2]
    result = Yahtzee.score_by_rule(dice, "fives")
    expect(result).to eq(5)
  end

  it "scores sixes" do
    dice = [6, 6, 1, 1, 2]
    result = Yahtzee.score_by_rule(dice, "sixes")
    expect(result).to eq(12)
  end

  it "scores singles as 0 if none are in dice" do
    dice = [6, 4, 3, 3, 5]
    result = Yahtzee.score_by_rule(dice, "ones")
    expect(result).to eq(0)
  end

  it "scores a single pair" do
    dice = [6, 6, 4, 3, 2]
    result = Yahtzee.score_by_rule(dice, "pair")
    expect(result).to eq(12)
  end

  it "scores the highest pair" do
    dice = [6, 6, 5, 5, 2]
    result = Yahtzee.score_by_rule(dice, "pair")
    expect(result).to eq(12)
  end

  it "scores a pair when there are three" do
    dice = [6, 6, 6, 5, 2]
    result = Yahtzee.score_by_rule(dice, "pair")
    expect(result).to eq(12)
  end

  it "scores two pairs" do
    dice = [6, 6, 4, 4, 2]
    result = Yahtzee.score_by_rule(dice, "two_pair")
    expect(result).to eq(20)
  end

  it "scores three of a kind" do
    dice = [6, 5, 5, 5, 2]
    result = Yahtzee.score_by_rule(dice, "three_of_a_kind")
    expect(result).to eq(15)
  end

  it "scores four of a kind" do
    dice = [1, 1, 1, 1, 2]
    result = Yahtzee.score_by_rule(dice, "four_of_a_kind")
    expect(result).to eq(4)
  end

  it "scores Yahtzee" do
    dice = [1, 1, 1, 1, 1]
    result = Yahtzee.score_by_rule(dice, "Yahtzee")
    expect(result).to eq(50)
  end

  it "doesn't score a Yahtzee if all die are not the same" do
    dice = [1, 1, 1, 1, 2]
    result = Yahtzee.score_by_rule(dice, "Yahtzee")
    expect(result).to eq(0)
  end

  it "scores a full house" do
    dice = [2, 2, 1, 1, 1]
    result = Yahtzee.score_by_rule(dice, "full_house")
    expect(result).to eq(7)
  end

  it "should not score a full house unless rolls contain pair and three of a kind" do
    dice = [1, 1, 2, 2, 4]
    result = Yahtzee.score_by_rule(dice, "full_house")
    expect(result).to eq(0)
  end

  it "should score a small straight" do
    dice = [5, 4, 2, 3, 1]
    result = Yahtzee.score_by_rule(dice, "small_straight") 
    expect(result).to eq(15)
  end

end
