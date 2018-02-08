class NumbersGame

  attr_accessor :secret_number, :input_number, :guesses_left

  def initialize
    @guesses_left = 3
  end

  def how_many_guesses_left
    puts "You have #{guesses_left} guesses left."
  end

  def make_guess
    puts "Please enter your guess between 1 to 10 inclusive."
    @input_number = gets.chomp.to_i
    compare_guess
  end

  def compare_guess
    if @input_number == @secret_number
      puts "You won!"
    elsif @input_number > @secret_number 
      puts "Your guess was too high!"
    else 
      puts "Your guess was too low!"
    end
  end

end

