require 'gossip'
class ApplicationController < Sinatra::Base


  get '/' do #requête GET qui demande d'afficher le contenu d'une URL donnée
    erb :index, locals: {gossips: Gossip.all} #méthode locals qui envoi lavariable array obtenu par Gossip.all
  end
  
  get '/gossips/new/' do #requête GET qui demande d'afficher le contenu d'une URL donnée
    erb :new_gossip
  end

  post '/gossips/new/' do #requête POST qui envoie le contenu d'un formulaire et obtient une réponse en retour
    puts "Salut, je suis dans le serveur"
  puts "Ceci est le contenu du hash params : #{params}"
  puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
  puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
  puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"

    Gossip.new(params["gossip_author"], params["gossip_content"]).save #contenu récupéré dans le formulaire rempli par l'utilisateur
    redirect '/'
  end

  get '/gossips/:id/' do #requête GET qui demande d'afficher le contenu d'une URL donnée
    
    "Voici le numéro du potin que tu veux : Gossip #{params['id']}!"
  end

  

end