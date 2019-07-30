require 'csv'

class Gossip
  attr_accessor :author, :content

    def initialize(author, content)

      @author = author
      @content = content
    end
  

    def save #méthode sauvegarde
        CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [@author, @content]
        end
      end

    def self.all #méthode d'enregistrement de tous les gossips dans un array
      all_gossips = []
      CSV.read("./db/gossip.csv").each do |csv_line|
        all_gossips << Gossip.new(csv_line[0], csv_line[1])
      end
      return all_gossips
    end

    def self.find(id) 
        array_de_gossip = self.all #On récupère l’array  all_gossips de la méthode self.all
        return array_de_gossip[id-1] #On retourne l’élément de l’array correspondant au numéro de l'id-1 (car les arrays commencent à 0)
    end
   
end 