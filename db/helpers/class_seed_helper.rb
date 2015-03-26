# seeds rarities from user defined list
def seed_classes

  class_list = Array.new

  class_list << [name: "Neutral"]

  class_list << [name: "Druid",		hero: "Malfurion Stormrage",	colour: "Orange",  		hexcolour: "#FF7D0A"]
  class_list << [name: "Hunter",	hero: "Rexxar",   				colour: "Green",   		hexcolour: "#ABD473"]
  class_list << [name: "Mage",		hero: "Jaina Proudmoore", 		colour: "Light blue",   hexcolour: "#69CCF0"]
  class_list << [name: "Paladin",	hero: "Uther Lightbringer", 	colour: "Pink",   		hexcolour: "#F58CBA"]
  class_list << [name: "Priest",	hero: "Anduin Wrynn",  			colour: "White",   		hexcolour: "#FFFFFF"]
  class_list << [name: "Rogue",		hero: "Valeera Sanguinar",		colour: "Light yellow", hexcolour: "#FFF569"]
  class_list << [name: "Shaman",	hero: "Thrall",  				colour: "Blue",   		hexcolour: "#0070DE"]
  class_list << [name: "Warlock",	hero: "Gul'dan",   				colour: "Purple", 		hexcolour: "#9482C9"]
  class_list << [name: "Warrior",	hero: "Garrosh Hellscream", 	colour: "Tan", 			hexcolour: "#C79C6E"]

  class_list.each do |player_class|
    PlayerClass.create(player_class)
  end
end
