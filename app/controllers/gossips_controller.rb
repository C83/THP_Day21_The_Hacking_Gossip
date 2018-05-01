class GossipsController < ApplicationController
	def new
		@g = Gossip.new
	end

	def index
		@list_gossips = Gossip.all
	end

	def create
		# On utilise params.permit afin de sélectionner les arguments que l'on veut utiliser pour la création de notre gossip
	 	g = Gossip.create(params.require(:gossip).permit(:anonymous_author, :content))
	  	# On ajoute une redirection une fois le gossip créé
	  	unless g == nil
	  		redirect_to gossip_path(g.id)
	  	# else
	  	# 	redirect_to show_user_error_create_path
	  	end
	end

	def show
		# On utilise permit là encore pour des questions de sécurité : seul le paramètre en question sera recherché. 
		# Dans ce cas, on utilse find_by car la fonction permet d'indiquer ce que l'on recherche suivi de la valeur
		@g = Gossip.find_by(params.permit(:id))
		@c = Comment.new
	end

	def edit
		# On utilise permit là encore pour des questions de sécurité : seul le paramètre en question sera recherché. 
		# Dans ce cas, on utilse find_by car la fonction permet d'indiquer ce que l'on recherche suivi de la valeur
		@g = Gossip.find_by(params.permit(:id))
	end

	def update
		g = Gossip.find_by(params.permit(:id))
	 	g.update(params.require(:gossip).permit(:anonymous_author, :content))
	 	redirect_to gossip_path(g.id)
	end

	def destroy
		g = Gossip.find_by(params.permit(:id))
	 	g.destroy
	 	redirect_to gossips_path
	end

end
