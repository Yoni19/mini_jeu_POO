require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#Ecran d'acceuil du jeu
puts "======================================================"
puts "= Bienvenue sur 'Ils veulent tous ma POO' !          ="
puts "= Le but de ce jeu est d'etre le dernier survivant ! ="
puts "======================================================"

#Acceuil du joueur et demande de son pseudo
puts " "
puts " Bonjour jeune joueur et bienvenue dans 'Ils veulent tous ma POO' c'est un jeu difficile mais je te promet que tu t'amusera !"
puts "Quel est ton nom ?"
print "> "
human_player = HumanPlayer.new(gets.chomp)
puts " "

#Creation des ennemies
enemies = []
player1 = Player.new('Josiane')
player2 = Player.new('José')
enemies.push(player1, player2)

#lancement du combat
while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0) do
  #menu d'action 
  puts "-" * 50
  puts " "
  human_player.show_state
  puts " "
  puts "Quelle action veux-tu effectuer ?"
  puts " "
  puts "a - Chercher une meilleure arme"
  puts "s - Chercher à se soigner"
  puts " "
  puts "Attaquer un joueur en vue :"
  print "0 - "
  player1.show_state
  print "1 - "
  player2.show_state
  print "q - Quitter le jeu"
  puts " "
  puts "-" * 50
  puts " "
  answer = gets.chomp.to_s
#action

  if answer == "a"
  human_player.search_weapon
  elsif answer == "s"
  human_player.search_health_pack
  elsif answer == "0"
  human_player.attacks(player1)
    if player1.life_points <=0
      player1.life_points = 0
    end
  elsif answer == "1"
  human_player.attacks(player2)
  if player2.life_points <0
    player2.life_points = 0
  end
  elsif answer == "q"
    puts "Tu as quitté le jeu, reviens vite dans l'arène ! A bientot combattant"
    return 
  end
  
  #rispote des bots
  puts "-" * 50
  puts " "
  puts "Les autres joueurs t'attaquent !"
  enemies.each do |player| 
    if player.life_points > 0
      player.attacks(human_player)
    end
  end


    #fin du jeu 
    puts " "
puts "-" * 50
puts " "
  if human_player.life_points > 0 && player1.life_points <= 0 && player2.life_points <= 0
  puts "BRAVO ! TU AS GAGNE !"
  elsif human_player.life_points <= 0
  puts "Loser ! Tu as perdu ! Tu es une MERDEEEE"
  end

end 