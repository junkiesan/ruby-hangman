class Hangman
  def initialize 
    @word = words.sample
    @lives =  7
    @word_teaser = ""
    
    @word.first.size.times do
      @word_teaser += "_ "
    end
  end
  
  def words
    [
      ["computer", "the basic tool of every IT"],
      ["yukihiromatsumoto", "the creator of this beautiful language"],
      ["framework", "jungle of javascript librairies"],
      ["startup", "wild place to make a living"],
      ["stackoverflow", "first reason to live for a developer"]
    ]
  end
  
  def print_teaser(last_guess = nil)
    update_teaser(last_guess) unless last_guess.nil?
    p @word_teaser  
  end

  def update_teaser(last_guess)
    new_teaser = @word_teaser.split

    new_teaser.each_with_index do |letter, index|
      if letter == '_' && @word.first[index] == last_guess
        new_teaser[index] = last_guess
      end
    end
    @word_teaser = new_teaser.join(' ')
  end

  def make_guess   
    if @lives > 0
      p "Which letter do you want to ask"
      guess = gets.chomp
      # p "you guessed #{guess}"
      good_guess = @word.first.include?(guess)
      if guess == 'exit'
        p "Thanks for playing"
      elsif guess.size > 1
        p "Wrong credentials! Try again!"
        make_guess
      elsif good_guess
        p "Good guess!"
        print_teaser(guess)

        if @word.first == @word_teaser.split.join
          p "Bravo, you found the word!"
        else
          make_guess
        end

      else
        @lives -= 1
        p "Too bad, you still have #{@lives} guesses, try again!"
        make_guess
      end
    else
      p "GAME OVER"
    end
  end

  def begin
    # ask letter
      p "Welcome to this Hangman game ! Your word is #{@word.first.size} long !"
      p "to exit enter exit"
      print_teaser
      p "Clue : #{@word.last} "
      make_guess
  end

end 

game = Hangman.new
game.begin