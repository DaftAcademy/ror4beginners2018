require 'faker'
load 'warrior.rb'
load 'monster.rb'
load 'battle_arena.rb'

warrior1 = Warrior.new(name: 'Po', level:  1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)
warrior1.card
warrior1.strength
warrior1.strength
warrior2.card
monster1.card
arena = BattleArena.new(warrior1, warrior2)
arena.battle!
warrior1.card
warrior2.card
arena.battle!
warrior1.card
arena = BattleArena.new(warrior1, monster1)
arena.battle!
monster1.card