class Printer

  def ask_number_of_players
    print "How many players? (1-5): "
    gets.chomp.to_i
  end

  def invalid_number_of_players
    puts "\nYou must specify a valid number of players (min:1 / max:5)\n\n"
  end

  def ask_player_name(number)
    print "What is player #{number}'s name? "
    gets.chomp
  end

  def invalid_name
    puts "\nSorry, you must specify a name. Try again.\n\n"
  end

  def name_already_exists
    puts "\nSorry, that name has been taken. Try again.\n\n"
  end

  def display_blank_word(blank_word)
    puts "\n#{blank_word}"
  end

  def ask_guess(name)
    print "\n#{name}, guess a letter, or enter ! to solve the puzzle: "
    gets.chomp.downcase
  end

  def invalid_guess
    puts "Please specify ONE letter."
  end

  def already_guessed
    puts "That letter has already been played, silly!"
  end

  def ask_solution(name)
    print "\n#{name}, what is your guess? "
    gets.chomp.downcase
  end

  def solution(word)
    puts "\nThe solution was \"#{word}\"."
  end

  def winner(name)
    puts "#{name} wins! Congratulations!\n\n\n"
  end
end
