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
end
