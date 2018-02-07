	describe "generate random number" do

		describe "generate a number" do
			it "verifies if a number exists" do
				expect(NumbersGame.generate_random_number.is_a?(Fixnum)).to be true
			end
		end

		describe "generate a number between 1 and 10 inclusive" do
			it "verifies if a number is between 1 and 10 inclusive" do
				expect(NumbersGame.generate_random_number.between?(1,10)).to be true
			end
		end

	end


