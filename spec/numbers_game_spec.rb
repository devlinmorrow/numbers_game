require 'numbers_game'
require 'stringio'

describe NumbersGame do
  context "given a secret_number of 4" do
    before do
      @first_game = NumbersGame.new
      @first_game.secret_number = 4
    end
    describe "the guess is correct" do
      context "given input of 4" do
        before do
          @first_game.input_number = 4
        end
        it "states 'You won!'" do
          expect{@first_game.compare_guess}.to output("You won!\n").to_stdout
        end
      end
    end
    describe "the guess is too high" do
      context "given input of 7" do
        before do
          @first_game.input_number = 7
        end
        it "states 'Your guess was too high.'" do
          expect{@first_game.compare_guess}.to output("Your guess was too high!\n").to_stdout
        end
      end
    end
    describe "the guess is too low" do
      context "given input of 2" do
        before do
          @first_game.input_number = 2
        end
        it "states 'Your guess was too low.'" do
          expect{@first_game.compare_guess}.to output("Your guess was too low!\n").to_stdout
        end
      end
    end
    describe "user makes a guess" do
      before do
        $stdin = StringIO.new("4")
      end
      it "makes a guess" do
        expect{@first_game.make_guess}.to output.to_stdout
      end
    end 

  end
end

