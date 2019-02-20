require_relative 'monster'
require_relative 'warriors'
require_relative 'battleArena'

warrior1 = Warrior.new(name: 'Po', level: 1)
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
warrior2.card

arena.battle!
warrior1.card
warrior2.card

arena.battle!
warrior1.card
warrior2.card

arena.battle!
warrior1.card
warrior2.card

warrior2.level = Character.max_level
warrior2.card
arena.battle!
warrior1.card
warrior2.card

arena = BattleArena.new(warrior1, monster1)
arena.battle!

monster1.card