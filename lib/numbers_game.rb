class NumbersGame

  attr_accessor :secret_number, :guesses_left
  attr_reader :input_number, :is_game_won

  def initialize(input = $stdin, output = $stdout)
    @input = input
    @output = output  
    @guesses_left = 3
    @is_game_won = false
    @secret_number = rand(1..10)
  end

  def play_game
    while @guesses_left > 0 && !@is_game_won 
      display_how_many_guesses_left
      run_guess
    end
    if @is_game_won == false
      @output.puts "Sorry, you lost!"
    end
  end

  def display_how_many_guesses_left
    if @guesses_left != 1
      @output.puts "You have #{@guesses_left} guesses left."
    else
      @output.puts "You have 1 guess left."
    end
  end

  def take_guess_input
    @output.puts "Please enter your guess between 1 to 10 inclusive."
    @input_number = @input.gets.chomp.to_i
  end

  def compare_guess(first_compare_number, second_compare_number)
    if first_compare_number == second_compare_number 
      game_won
    elsif first_compare_number > second_compare_number
      @output.puts "Your guess was too high!"
    else 
      @output.puts "Your guess was too low!"
    end
  end

  def run_guess
    take_guess_input
    compare_guess(@input_number, @secret_number)
    minus_one_guess
  end

  def minus_one_guess
    @guesses_left -= 1
  end

  def game_won
    @output.puts "You won!"
    @is_game_won = true
  end

end

