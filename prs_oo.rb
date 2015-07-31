#Paper Rock Scissors OO Version

class Player
  CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
  
  attr_accessor :choice
  
  def input_choice
    begin
      puts "Pick one: (p, r, s):"
      self.choice = gets.chomp.downcase
    end until CHOICES.keys.include?(choice)
  end
  
  def make_choice
     self.choice = CHOICES.keys.sample
  end

  def get_choice
    CHOICES[@choice]
  end
  
  def == (other)
    @choice == other.choice
  end
  
  def > (other)
    result = true
    case @choice
    when 'p'
      if other.choice == 's'
        result = false
      end
    when 'r'
      if other.choice == 'p'
        result = false
      end
    when 's'
      if other.choice == 'r'
        result = false
      end
    end
    result
  end
  
  def < (other)
    !(@choice > other)
  end
end


class Game
  attr_accessor :person, :computer
  
  def initialize
    @person= Player.new
    @computer= Player.new
  end
  
  def display_winning_message(winning_choice, player)
    case winning_choice
    when 'p'
      puts "Paper wraps Rock! #{player}!"
    when 'r'
      puts "Rock smashes Scissors! #{player}!"
    when 's'
      puts "Scissors cuts Paper! #{player}!"
    end
  end

  def run
    loop do
      person.input_choice
      computer.make_choice
      
      puts "You picked #{person.get_choice} and computer picked #{computer.get_choice}"
      if person == computer
        puts "It's a tie!"
      #player wins?
      elsif (person > computer)
        display_winning_message(person.choice, "You win")
      else
        display_winning_message(computer.choice, "Computer wins")
      end
  
      puts "Play again (y/n)"
      break if gets.chomp.downcase != 'y'
    
    end

  end
  
end

Game.new.run
