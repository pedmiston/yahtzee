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

end
