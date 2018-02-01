require 'numbers_game'

describe NumbersGame do

	describe "correct guess" do
		context "given an input" do
			it "returns 'Correct'" do
				expect(NumbersGame.correct_guess(4)).to eql(4)
			end
		end
	end
end
