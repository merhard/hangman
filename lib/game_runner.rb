require_relative 'printer'
require_relative 'players'
require_relative 'word'

@players = Players.new
@word = Word.new
@printer = Printer.new
@player_number = 0

def start_game
  system('clear')
  number_of_players_asker
end

def number_of_players_asker
  number = @printer.ask_number_of_players

  if @players.valid_number_of_players?(number)
    @players.number_of = number
    player_names_asker
  else
    @printer.invalid_number_of_players
    number_of_players_asker
  end
end

def player_names_asker
  if @players.all_names_entered?
    round_doer
  else
    @player_number += 1

    player_name = @printer.ask_player_name(@player_number)

    player_name = no_name_looper(player_name)

    player_name = invalid_name_looper(player_name)

    @players.names_list << player_name

    player_names_asker
  end
end

def no_name_looper(player_name)
  if @players.name_given?(player_name)
    player_name
  else
    @printer.invalid_name
    player_name = @printer.ask_player_name(@player_number)
    no_name_looper(player_name)
  end
end

def invalid_name_looper(player_name)
  if @players.name_already_exists?(player_name)
    @printer.name_already_exists
    player_name = @printer.ask_player_name(@player_number)
    player_name = no_name_looper(player_name)
    invalid_name_looper(player_name)
  else
    player_name
  end
end

def round_doer
  names_list = @players.randomizer(@players.names_list)
  game_over = false

  names_list.each do |name|
    system('clear')
    game_over = turn_taker(name)
    if game_over
      @printer.solution(@word.current_word)
      @printer.winner(name)
      break
    end
  end

  unless game_over
    round_doer
  end
end

def turn_taker(name)
  @printer.display_blank_word(@word.display_current_game)
  @printer.display_already_guessed_letters(@word.guessed_letters)

  guess = @printer.ask_guess(name)

  unless guess.length == 1
    system('clear')
    @printer.invalid_guess
    turn_taker(name)
  end

  if @word.already_guessed?(guess)
    system('clear')
    @printer.already_guessed
    turn_taker(name)
  end

  if @word.in_word?(guess)
    @word.replace_blank_with_letter(guess)
  end

  if guess == "!"
    game_over = puzzle_guesser(name)
  else
    @word.guessed_letters << guess
  end

  unless @word.display_current_game.include?('_')
    game_over = true
  end

  game_over
end

def puzzle_guesser(name)
  guess = @printer.ask_solution(name)
  @word.correct_word?(guess)
end


start_game
