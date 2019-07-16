class RandNumberGame

  def initialize
    @top = 100
    @middle = 50
    @low = 0
  end

  def start
    puts "Choose game mode:\n
    1. Computer guess\n
    2. Human guess"
    answer = gets.to_i
    case answer
    when 1
      computer_guesses
    when 2
      human_guesses
    else
      exit
    end
  end

  def computer_guesses
    puts "Enter the number between 0 and 100
    that you want the computer to guess:"
    number = gets.to_i
    p count = 1
    unless (1..100).include?(number)
      puts 'Wrong'
      start
    end
    puts "Enter the number of computer attempts"
    retries = gets.to_i
    loop do
      break if count == (retries + 1)
      puts "Attempt #{count.to_s}."
      puts "#{@middle} - it is your number?
            1 - Yes
            2 - no, its less
            3 - no, its more"
      answer = gets.to_i
      case answer
      when 1
        puts "Computer wins"
        exit
      when 2
        @top = @middle - 1
        @middle = (@low + @top) / 2
        count += 1
      when 3
        @low = @middle - 1
        @middle = (@low + @top) / 2
        count += 1
      end
    end
    puts "Computer lost"
    exit
  end

  def human_guesses
    puts "Guess number game."
    number = (1 + rand(99)).to_s
    count = 1
    puts "Enter the number of attempts"
    retries = gets.to_i
    puts "Enter a number from 0 to 100 or quit to exit."
    puts "There are #{retries.to_s} attempts."
    loop do
      break if count == (retries + 1)
      attempt = gets.chomp
      puts "Attempt #{count.to_s}."
      case attempt
      when number
        puts "Guessed! It is " + number.to_s
        puts "Another guess?"
        break
      when 'quit'
        puts "Leaving"
        puts "It was "+ number.to_s
        break
      else
        if attempt > number
          puts " Less"
        else
          puts " More"
        end
      end
      count += 1
    end
  end

  RandNumberGame.new.start

end
