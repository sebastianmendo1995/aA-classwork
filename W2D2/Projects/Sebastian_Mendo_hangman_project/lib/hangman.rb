class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  #Phase 1
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end

  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |letter, idx|
      arr << idx if letter == char
    end
    arr
  end

  def fill_indices(char, arr_indices)
    @guess_word.each_with_index do |letter, idx|
      @guess_word[idx] = char if arr_indices.include?(idx)
    end
  end

  #Phase 2

  def try_guess(char)
    if already_attempted?(char)
      p 'that has already been attempted'
      return false
    else 
      @attempted_chars << char
      indices = get_matching_indices(char)
      @remaining_incorrect_guesses -= 1 if indices.empty?
      fill_indices(char, indices)
      return true
    end
  end

  def ask_user_for_guess
    p "Enter a char:"
    letter=gets.chomp
    self.try_guess(letter)
  end
  
  def win?
    if @guess_word.join("")==@secret_word
      p "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses==0
      p "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    else
      return false
    end
  end


end
