require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Assacind")
player2 = Player.new("Xpile")
puts " "
puts "Mesdames et Messieurs le combat va bientot commencer !!! "
puts "Voyons l'etat de forme de nos combattants !"
puts " "
puts player1.show_state
puts player2.show_state
puts " "
puts "#{player1.name} aura l'honneur d'exécuter la premiere attaque !"

while player1.life_points > 0 && player2.life_points > 0
player1.attacks(player2) 
  if player2.life_points <= 0
  break
  end
  puts " "
  puts "================================"
  puts " "
  puts "Voici l'état de nos combattants :"
  puts ""
  puts player1.show_state
  puts player2.show_state 
  puts "================================"
puts " "
puts "#{player2.name} ne se laissera pas faire !!! Il vise les dents !"
player2.attacks(player1) 
  if player1.life_points > 0
puts " "
puts "================================"
puts " "
  puts "Voici l'état de nos combattants :"
  puts ""
  puts player1.show_state
  puts player2.show_state 
  puts "================================"
  end
end
puts "Le combat est terminé !"
