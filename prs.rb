#Paper rock sissors

CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}

puts "Welcome to Paper, Rock, Scissors!"
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

loop do
  # player makes a pick
  
  begin
    puts "Pick one: (p, r, s):"
    player_choice= gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)
  
  # computer makes a pick
  computer_choice = CHOICES.keys.sample
  
  if player_choice == computer_choice
    puts "It's a tie!"
    #player wins?
  elsif (player_choice == 'p' && computer_choice == 'r') ||
    (player_choice == 'r' && computer_choice == 's') ||
     (player_choice == 's' && computer_choice == 'p')
     display_winning_message(player_choice, "You win")
  else
    display_winning_message(computer_choice, "Computer wins")
  end
  
  puts "Play again (y/n)"
  break if gets.chomp.downcase != 'y'
    
end

puts "Good bye!"

