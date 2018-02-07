describe "compare the guess to the random_number and state if correct, too low or too high" do

		context "given a random_number of 4" do

			describe "the guess is correct" do
				context "given input of 4" do
					before do

						@first_game = NumbersGame.new
						@first_game.generate_random_number(4)
						@first_game.store_guess(4)
					end

					it "returns 'Correct'" do
						expect(@first_game.compare_guess).to eql("Correct")
					end
				end
			end

			describe "the guess is too high" do
				context "given input of 7" do
					before do

						@first_game = NumbersGame.new
						@first_game.generate_random_number(4)
						@first_game.store_guess(7)

					end

					it "returns 'Too high'" do
						expect(@first_game.compare_guess).to eql("Too high")
					end
				end
			end

			describe "the guess is too low" do
				context "given input of 2" do
					before do

						@first_game = NumbersGame.new
						@first_game.generate_random_number(4)
						@first_game.store_guess(2)

					end

					it "returns 'Too low'" do
						expect(@first_game.compare_guess).to eql("Too low")
					end
				end
			end


		end

	end


