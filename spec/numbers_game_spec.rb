require 'numbers_game'

describe NumbersGame do
  describe "user inputs a guess" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      $stdin = StringIO.new("7")
      @example_game.take_guess_input
    end
    it "should let the input number be the number the user enters" do
      expect(@example_game.input_number).to eql(7)
    end
  end
  describe "the guess is correct" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      @example_game.input_number = 4
    end
    it "finds that input and secret numbers are equivalent" do
      expect{@example_game.compare_guess(@example_game.input_number, @example_game.secret_number)}.to output(/won/).to_stdout
    end
  end
  describe "the guess is too high" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      @example_game.input_number = 7
    end
    it "finds that input number is higher than secret number" do
      expect{@example_game.compare_guess(@example_game.input_number, @example_game.secret_number)}.to output(/high/).to_stdout
    end
  end
  describe "the guess is too low" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      @example_game.input_number = 2
    end
    it "finds that input number is lower than secret number" do
      expect{@example_game.compare_guess(@example_game.input_number, @example_game.secret_number)}.to output(/low/).to_stdout
    end
  end
  describe "make a guess" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      $stdin = StringIO.new("7\n7\n7")
    end
    it "should provide an answer after an input has been entered" do
      expect{@example_game.play_game}.to output(/high/).to_stdout
    end
  end
  describe "user begins with 3 guesses" do
    before do
      @example_game = NumbersGame.new
    end
    it "should start with 3 guesses left" do
      expect(@example_game.guesses_left).to eql(3)
    end
  end
  describe "user told how many guesses left" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      $stdin = StringIO.new("7\n7\n7")
    end
    it "states how many guesses the user has left" do
      expect{@example_game.play_game}.to output(/guesses left/).to_stdout
    end
  end
  describe "after making a guess, minus one guess" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      $stdin = StringIO.new("7\n7\n7")
      @example_game.play_game
    end
    it "should minus one from guesses left until 0" do
      expect(@example_game.guesses_left).to eql(0)
    end
  end
  describe "state when 1 guess left" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      $stdin = StringIO.new("7\n7\n\7")
    end
    it "should state when 1 guess left" do
      expect{@example_game.play_game}.to output(/1 guess /).to_stdout
    end
  end
  describe "the user loses when there are 0 guesses left" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      @example_game.guesses_left = 0
    end
    it "should end when 0 guesses left" do
      expect{@example_game.play_game}.not_to output(/guesses/).to_stdout
    end
    it "should tell user they lost" do
      expect{@example_game.play_game}.to output(/lost/).to_stdout
    end
  end
  describe "if the input matches the secret number, you win" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 7
      $stdin = StringIO.new("7")
    end
    it "should state game won" do
      expect{@example_game.play_game}.to output(/won/).to_stdout
    end
  end
  describe "if the input matches the secret number, the game ends" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 7
      $stdin = StringIO.new("7")
      @example_game.play_game
    end
    it "should have 2 guesses left if game won with first input" do
      expect(@example_game.guesses_left).to eql(2)
    end
  end
end

