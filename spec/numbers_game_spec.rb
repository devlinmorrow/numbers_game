require 'numbers_game'

describe NumbersGame do
  subject(:example_game) {
    NumbersGame.new 
  }
  before do
    example_game.secret_number = 4
  end
  it "should let the input number be the number the user enters" do
    $stdin = StringIO.new("7")
    example_game.take_guess_input
    expect(example_game.input_number).to eql(7)
  end
  describe "comparison mechanic" do
    it "prints 'won' if input equivalent to secret number" do
      example_game.input_number = 4
      expect{example_game.compare_guess(4,4)}.to output(/won/).to_stdout
    end
    it "prints 'high' if input higher than secret number" do
      expect{example_game.compare_guess(7,4)}.to output(/high/).to_stdout
    end
    it "prints 'low' if input lower than secret number" do
      expect{example_game.compare_guess(2,4)}.to output(/low/).to_stdout
    end
  end
  it "should run compare after taking input" do
    $stdin = StringIO.new("7")
    expect{example_game.run_guess}.to output(/high/).to_stdout
  end
  describe "guesses left mechanic" do
    it "should start with 3 guesses left" do
      expect(example_game.guesses_left).to eql(3)
    end
    it "states how many guesses the user has left" do
      expect{example_game.display_how_many_guesses_left}.to output(/guesses left/).to_stdout
    end
    it "after guess made, minus 1 from guesses left" do
      example_game.minus_one_guess
      expect(example_game.guesses_left).to eql(2)
    end
    it "should state when 1 guess left" do
      example_game.guesses_left = 1
      expect{example_game.display_how_many_guesses_left}.to output(/1 guess /).to_stdout
    end
  end
  describe "user loses" do
    before do
      example_game.guesses_left = 0
    end
    it "should end when 0 guesses left" do
      expect{example_game.play_game}.not_to output(/guesses/).to_stdout
    end
    it "should tell user they lost" do
      expect{example_game.play_game}.to output(/lost/).to_stdout
    end
  end
  describe "user wins" do
    before do
      example_game.input_number = 4
      it "should state game won" do
        expect{example_game.play_game}.to output(/won/).to_stdout
      end
      it "should have 2 guesses left if game won with first input" do
        expect(example_game.guesses_left).to eql(2)
      end
    end
  end
end
