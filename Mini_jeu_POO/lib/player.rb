class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(num)
      @life_points = @life_points - num
      if @life_points <= 0
      puts "Le joueur #{@name} à été tué !"
    end 
  end

  def attacks(player)
    puts "Le joueur #{@name} attaque #{player.name} !!!"
    degat = compute_damage
    player.gets_damage(degat)
    
    puts "Il lui à infligé #{degat} points de dégat !!!"
    
  end



    def compute_damage
      return rand(1..6)
    end
    
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}. Ca fait beaucoup la non ???"
  end

  def compute_damage
    rand(1..6)* @weapon_level
  end

  def search_weapon
    weapon_find = rand(1..6)
    puts "WOOOOOOHHHHH tu as trouvé une arme de niveau #{weapon_find}"
    if weapon_find > @weapon_level
      @weapon_level = weapon_find
      puts "DAMN ! Elle est meilleure que ton arme actuelle ! Trouver c'est trouver, on la garde !!!"
    else 
      puts "Bof, c'est un peu de la merde, jettons cette daube"
    end
  end

  def search_health_pack
    health_pack_found = rand(1..6)
      if health_pack_found == 1
        puts "Pas de chance, tu n'as rien trouvé"
      elsif health_pack_found == 2 || health_pack_found == 3 || health_pack_found == 4 || health_pack_found == 5
        if @life_points == 50
          @life_points = 100
        else 
          @life_points = @life_points + 50
        end
        puts " WTF ! tu as trouvé un pack de soin de 50 points de vie, bravo !"
      elsif health_pack_found == 6
        if @life_points == 80
          @life_points = 100
        else 
          @life_points = @life_points + 80
        end
        puts "Bravooooooo ! tu as trouvé un pack de soin de 80 points de vie ! tu te sens mieux hein?"
      end
  end

end