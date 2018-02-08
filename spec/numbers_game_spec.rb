require 'numbers_game'
require 'stringio'

describe NumbersGame do
  describe "the guess is correct" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      @example_game.input_number = 4
    end
    it "states 'You won!'" do
      expect{@example_game.compare_guess(@example_game.input_number, @example_game.secret_number)}.to output(/won/).to_stdout
    end
  end
  describe "the guess is too high" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      @example_game.input_number = 7
    end
    it "states 'Your guess was too high.'" do
      expect{@example_game.compare_guess(@example_game.input_number, @example_game.secret_number)}.to output(/high/).to_stdout
    end
  end
  describe "the guess is too low" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      @example_game.input_number = 2
    end
    it "states 'Your guess was too low.'" do
      expect{@example_game.compare_guess(@example_game.input_number, @example_game.secret_number)}.to output(/low/).to_stdout
    end
  end
  describe "user told how many guesses left" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      @example_game.input_number = 2
    end
    it "states how many guesses the user has left" do
      expect{@example_game.display_how_many_guesses_left}.to output("You have 3 guesses left.\n").to_stdout
    end
  end
  describe "input a guess" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      $stdin = StringIO.new("7")
      @example_game.take_guess_input
    end
    it "should let user input a guess" do
      expect(@example_game.input_number).to eql(7)
    end
  end
  describe "run compare after guess input" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      $stdin = StringIO.new("7\n7\n7")
    end
    it "should state that the guess was too high" do
      expect{@example_game.play_game}.to output(/high/).to_stdout
    end
  end
  describe "after guess, minus one guess" do
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
  describe "before each guess, tell you how many guesses left" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      $stdin = StringIO.new("7\n7\n\7")
    end
    it "should state how many guesses left" do
      expect{@example_game.play_game}.to output(/guesses/).to_stdout
    end
  end
  describe "if there are no guesses left, do not run the game" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      $stdin = StringIO.new("7\n7\n7")
      @example_game.guesses_left = 0
    end
    it "should not run when there are no guesses left" do
      expect{@example_game.play_game}.not_to output(/guesses/).to_stdout
    end
  end
  describe "if no guesses left, inform user they have lost" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 4
      $stdin = StringIO.new("7\n7\n7")
      @example_game.guesses_left = 0
    end
    it "should tell user they lost" do
      expect{@example_game.play_game}.to output(/lost/).to_stdout
    end
  end
  describe "if you won, game ends" do
    before do
      @example_game = NumbersGame.new
      @example_game.secret_number = 7
      $stdin = StringIO.new("7\n7\n7")
      @example_game.play_game
    end
    it "should end if game won with 2 guesses left" do
      expect(@example_game.guesses_left).to eql(2)
    end
    describe "do not lose if you win" do
      before do
        @example_game = NumbersGame.new
        @example_game.secret_number = 7
        $stdin = StringIO.new("7\n7\n7")
      end
      it "should not output 'lost'" do
        expect{@example_game.play_game}.not_to output(/lost/).to_stdout
      end
    end
  end
end

