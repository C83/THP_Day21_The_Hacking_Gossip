class CommentsController < ApplicationController
	def create
		# On ne peut pas utiliser find_by étant donné que l'id du gossip est un nom que l'on a créé. De ce fait, il ne faut pas oublier de transformer en integer
		g = Gossip.find_by_id(params[:gossip_id].to_i)
		g.comments.create(params.require(:comment).permit(:anonymous_commentor, :body)) 
		redirect_to gossip_path(g.id)
	end

	def destroy
		# Cette fois, on peut utiliser find_by étant donné que le paramètre s'appelle bien id
		c = Comment.find_by(params.permit(:id))
		# Permet de rediriger ensuite vers le gossip
		id_gossip = c.gossip.id
		c.destroy
		redirect_to gossip_path(id_gossip)
	end

	def update
		c = Comment.find_by(params.permit(:id))
		c.update(params.require(:comment).permit(:anonymous_commentor, :body))
		c.save
		redirect_to gossip_path(c.gossip.id)
	end

	def edit
		# On utilise permit là encore pour des questions de sécurité : seul le paramètre en question sera recherché. 
		# Dans ce cas, on utilse find_by car la fonction permet d'indiquer ce que l'on recherche suivi de la valeur
		@c = Comment.find_by(params.permit(:id))
		@g = @c.gossip
	end

end
