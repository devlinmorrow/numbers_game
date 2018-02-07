class NumbersGame

  attr_accessor :secret_number, :input_number

  def make_guess
    puts "Please enter your guess."
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

