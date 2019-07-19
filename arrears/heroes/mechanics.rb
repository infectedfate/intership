module Mechanics

  def has_name
    define_method('name') { instance_variable_set("@name") }
    define_method('name=') { |val| instance_variable_set("@name", val) }
  end

  def has_health
    define_method('health') { instance_variable_get("@health") }
    define_method('health=') { |val| instance_variable_set("@health", val) }
  end

  def has_mana
    define_method('mana') { instance_variable_get("@mana") }
    define_method('mana=') { |val| instance_variable_set("@mana", val) }
  end

  def has_stamina
    define_method('stamina') {instance_variable_get("@stamina")}
    define_method('stamina=') { |val| instance_variable_set("@stamina", val) }
  end

  def can_attack
    define_method('damage') { instance_variable_get('@damage') }
    define_method('damage=') { |val| instance_variable_set("@damage", val) }
  end

  def can_take_damage
    define_method('take_damage') do |damage|
     if damage > instance_variable_get("@health")
       instance_variable_set("@health", 0)
     else
       instance_variable_set("@health", (instance_variable_get("@health") - damage))
     end
   end
  end

  def can_heal
    define_method('healing_power') { instance_variable_get('@healing_power') }
    define_method('healing_power=') { |val| instance_variable_set('@healing_power', val) }
  end
end
