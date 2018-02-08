class NumbersGame

  attr_accessor :secret_number, :input_number, :guesses_left, :is_game_won

  def initialize
    self.guesses_left = 3
    self.is_game_won = false
  end

  def play_game
    while self.guesses_left > 0 && self.is_game_won == false
      display_how_many_guesses_left
      take_guess_input
      compare_guess(self.input_number, self.secret_number)
      minus_one_guess
    end
    if self.is_game_won == false
      puts "Sorry, you lost!"
    end
  end

  def display_how_many_guesses_left
    if self.guesses_left != 1
      puts "You have #{guesses_left} guesses left."
    else
      puts "You have 1 guess left."
    end
  end

  def take_guess_input
    puts "Please enter your guess between 1 to 10 inclusive."
    self.input_number = gets.chomp.to_i
  end

  def compare_guess(input, comparator)
    if input == comparator 
      game_won
    elsif input > comparator 
      puts "Your guess was too high!"
    else 
      puts "Your guess was too low!"
    end
  end

  def minus_one_guess
    self.guesses_left -= 1
  end

  def game_won
    puts "You won!"
    self.is_game_won = true
  end

end

