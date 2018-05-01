class CommentsController < ApplicationController
	def create
		params.inspect
		g = Gossip.find_by_id(params[:gossip_id].to_i)
		g.comments.create(params.require(:comment).permit(:anonymous_commentor, :body)) 
		redirect_to gossip_path(g.id)
	end

	def destroy
	end

end
