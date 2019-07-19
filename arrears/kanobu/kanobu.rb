class Kanobu

  attr_accessor :rounds, :computer_wins, :human_wins, :count_of_cvc_rounds,
                :count_of_pvc_rounds, :second_player_wins, :first_player_wins
  def initialize
    @count_of_pvc_rounds = 0
    @case_of_win = {:stone => :scissors, :scissors => :paper, :paper => :stone}
    @kanobu = [:stone, :scissors, :paper]
    @computer_wins = 0
    @human_wins = 0
    @first_player_wins = 0
    @second_player_wins = 0
    @count_of_cvc_rounds = 1000
  end

  def calc_pvc(human_choice, computer_choice)
    if human_choice == computer_choice
      puts "Draw!"
    elsif human_choice == 0 && computer_choice == 1 ||
          human_choice == 1 && computer_choice == 2 ||
          human_choice == 2 && computer_choice == 0
          @human_wins + 1

    elsif human_choice == 0 && computer_choice == 2 ||
          human_choice == 1 && computer_choice == 0 ||
          human_choice == 2 && computer_choice == 1
          @computer_wins + 1
    end
  end

  def calc_cvc(first_player_choice, second_player_choice)
    if @case_of_win[first_player_choice] == second_player_choice
      @first_player_wins += 1
      puts "First player win!"
    elsif @case_of_win[first_player_choice] == @case_of_win[second_player_choice]
      puts "Draw!"
    else
      @second_player_wins += 1
      puts "Second player win!"
    end
  end

  def who_win
    if @human_wins < @computer_wins
      puts "You win!"
    else
      puts "Computer win!"
    end
  end

  def player_vs_computer
    while @count_of_pvc_rounds < 3
      puts "Begin"
      puts "Choose your weapon: 0 - stone 1 - scissors 2 - paper"

      human_choice = gets.chomp.to_i
      puts "Your choice: " + @kanobu[human_choice]

      computer_choice = rand(3)
      puts "Computer choose: " + @kanobu[computer_choice]

      calc_pvc(human_choice, computer_choice)
      @count_of_pvc_rounds += 1
    end
    who_win
  end

  def computer_vs_computer
    puts "Begin"
      File.open('variants', 'r') do |file|
        @count_of_cvc_rounds.times do
          choice = file.readline.split(' ')
          calc_cvc(choice[0].to_sym, choice[1].to_sym)
        end
      end
  end

  def calc_percent_of_wins
    p1 = @first_player_wins.to_f / @count_of_cvc_rounds.to_f * 100.00
    p2 = @second_player_wins.to_f / @count_of_cvc_rounds.to_f * 100.00
    [p1.to_i, p2.to_i]
  end
end
