require 'random_word_generator'

class Word
  attr_accessor :current_word, :current_game_state, :guessed_letters

  def initialize(new_word = nil)
    if new_word == nil
      @current_word = RandomWordGenerator.word
    else
      @current_word = new_word
    end

    @current_game_state = hasher(@current_word)
    @guessed_letters = []
  end

  def hasher(word)
    current_game_state = []
    word.split(//).each do |letter|
      current_game_state << {letter => "_"}
    end
    current_game_state
  end

  def display_current_game
    game_string = ""
    current_game_state.each do |hash|
      game_string << "#{hash.values[0]} "
    end
    game_string
  end

  def in_word?(letter)
    current_word.include?(letter.downcase)
  end

  def replace_blank_with_letter(letter)
    current_game_state.each do |hash|
      if hash.keys[0] == letter
        hash[letter] = letter
      end
    end
  end

  def already_guessed?(letter)
    guessed_letters.include?(letter)
  end

  def correct_word?(word)
    current_word == word
  end
end
