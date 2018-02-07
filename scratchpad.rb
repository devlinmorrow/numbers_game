
	describe "correct guess" do

		context "given the correct input of 4" do
			it "returns 'Correct'" do
				expect(NumbersGame.correct_guess(4)).to eql("Correct")
			end
		end

	end

	describe "guess too high" do

		context "given the input of 7 which is too high" do
			it "returns 'Too high'" do
				expect(NumbersGame.guess_too_high(7)
			end
		end
	end


end































