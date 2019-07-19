require_relative 'heroes'

class Battle

  def initialize
    @first_character = nil
    @second_character = nil
  end

  def let_the_battle_begin
    choose_first_character
    choose_second_character
    fight
  end

  def choose_first_character
    puts "Choose first character:
    1. Warrior
    2. Priest
    3. Thief
    4. Mage"
    answer = gets.to_i
    case answer
    when 1
      @first_character = Warrior.new
    when 2
      @first_character = Priest.new
    when 3
      @first_character = Thief.new
    when 4
      @first_character = Mage.new
    else
      exit
    end
  end

  def choose_second_character
    puts "Choose second character:
    1. Warrior
    2. Priest
    3. Thief
    4. Mage"
    answer = gets.to_i
    case answer
    when 1
      @second_character = Warrior.new
    when 2
      @second_character = Priest.new
    when 3
      @second_character = Thief.new
    when 4
      @second_character = Mage.new
    else
      exit
    end
  end

  def fight
    loop do
      break if dead?(@first_character) || dead?(@second_character)
      turn
    end
  end

  def turn
    puts "First character hits"
    @second_character.take_damage(@first_character.damage)
    puts "Second character health: #{@second_character.health}"

    puts "Second character hits"
    @first_character.take_damage(@second_character.damage)
    puts "First character health: #{@first_character.health}"

  end

  def dead?(character)
    character.health == 0
  end

  Battle.new.let_the_battle_begin
end
