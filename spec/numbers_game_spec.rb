require 'numbers_game'

describe NumbersGame do
  describe "generate random secret number" do
    it "should assign a random number to secret number" do
      example_game = NumbersGame.new
      expect(example_game.secret_number).not_to be_nil 
    end
  end
  describe "playing the game" do
    describe "input" do
      it "should let the input number be the number the user enters" do
        input = StringIO.new("3")
        output = StringIO.new
        example_game = NumbersGame.new(input, output)
        example_game.secret_number = 4
        example_game.take_guess_input
        expect(example_game.input_number).to eq(3)
      end
    end
    describe "comparison mechanic" do
      it "prints 'won' if input equivalent to secret number" do
        input = StringIO.new
        @output = StringIO.new
        example_game = NumbersGame.new(input, @output)
        example_game.compare_guess(4,4)
        expect(@output.string).to include("won")
      end
      it "prints 'high' if input higher than secret number" do
        input = StringIO.new
        @output = StringIO.new
        example_game = NumbersGame.new(input, @output)
        example_game.compare_guess(7,4)
        expect(@output.string).to include("high")
      end
      it "prints 'low' if input lower than secret number" do
        input = StringIO.new
        @output = StringIO.new
        example_game = NumbersGame.new(input, @output)
        example_game.compare_guess(2,4)
        expect(@output.string).to include("low")
      end
    end
    it "should run compare after taking input" do
      input = StringIO.new("7")
      @output = StringIO.new
      example_game = NumbersGame.new(input, @output)
      example_game.secret_number = 4
      example_game.run_guess
      expect(@output.string).to include("high")
    end
    describe "guesses left mechanic" do
      it "should start with 3 guesses left" do
        example_game = NumbersGame.new
        expect(example_game.guesses_left).to eql(3)
      end
      it "should state how many guesses left before each guess" do
        input = StringIO.new
        @output = StringIO.new
        example_game = NumbersGame.new(input, @output)
        example_game.display_how_many_guesses_left
        expect(@output.string).to include("guesses left")
      end
      it "should state when exactly one guess is left" do
        input = StringIO.new
        @output = StringIO.new
        example_game = NumbersGame.new(input, @output)
        example_game.guesses_left = 1
        example_game.display_how_many_guesses_left
        expect(@output.string).to include("1 guess left")
      end
      it "after guess made, minus 1 from guesses left" do
        input = StringIO.new("7")
        output = StringIO.new
        example_game = NumbersGame.new(input, output)
        example_game.secret_number = 4
        example_game.run_guess
        expect(example_game.guesses_left).to eql(2)
      end
    end
    describe "user loses" do
      it "should end when 0 guesses left" do
        input = StringIO.new
        @output = StringIO.new
        example_game = NumbersGame.new(input, @output)
        example_game.guesses_left = 0
        example_game.play_game
        expect(@output.string).not_to include("guesses")
      end
      it "should tell user that they lost" do
        input = StringIO.new("7")
        @output = StringIO.new
        example_game = NumbersGame.new(input, @output)
        example_game.guesses_left = 0
        example_game.play_game
        expect(@output.string).to include("lost")
      end
    end
    describe "user wins" do
      it "should tell user they won" do
        input = StringIO.new("4")
        @output = StringIO.new
        example_game = NumbersGame.new(input, @output)
        example_game.secret_number = 4
        example_game.play_game
        expect(@output.string).to include("won")
      end
    end
    describe "game runs" do
      it "should display 'guesses' three times" do
        input = StringIO.new("7\n7\n7")
        @output = StringIO.new
        example_game = NumbersGame.new(input, @output)
        example_game.secret_number = 4
        example_game.play_game
        expect(@output.string).to include("guesses")
      end
    end
  end
end
