require_relative 'mechanics'

class Warrior
  extend Mechanics

  has_mana
  has_health
  has_stamina
  can_attack
  can_take_damage

  def initialize
    @health = 100
    @mana = 50
    @stamina = 120
    @damage = 15
  end
end

class Mage
  extend Mechanics

  has_mana
  has_health
  has_stamina
  can_attack
  can_take_damage

  def initialize
    @health = 50
    @mana = 150
    @stamina = 70
    @damage = 25
  end
end

class Thief
  extend Mechanics

  has_mana
  has_health
  has_stamina
  can_attack
  can_take_damage

  def initialize
    @health = 80
    @mana = 50
    @stamina = 150
    @damage = 10
  end
end

class Priest
  extend Mechanics

  has_mana
  has_health
  has_stamina
  can_attack
  can_take_damage
  can_heal

  def initialize
    @health = 80
    @mana = 130
    @stamina = 80
    @damage = 8
    @healing_power = 25
  end
end
