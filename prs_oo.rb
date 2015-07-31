#Paper Rock Scissors OO Version

class Player
  include Comparable
  
  CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
  
  attr_reader :choice
  
  def input_choice
    begin
      puts "Pick one: (p, r, s):"
      @choice = gets.chomp.downcase
    end until CHOICES.keys.include?(choice)
  end
  
  def make_choice
     @choice = CHOICES.keys.sample
  end

  def get_choice
    CHOICES[@choice]
  end
  
  def <=>(other)
    result = 0
    if @choice != other.choice
      result = 1
      case @choice
      when 'p'
        if other.choice == 's'
          result = -1
        end
      when 'r'
        if other.choice == 'p'
          result = -1
        end
      when 's'
        if other.choice == 'r'
          result = -1
        end
      end
    end
    result
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
