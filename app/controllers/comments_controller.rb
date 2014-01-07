class CommentsController < ApplicationController
	def create
    	@link = Link.find(params[:link_id])
    	@comment = @link.comments.create(params[:comment].permit(:commenter, :body, :score, :link_id))
    	redirect_to link_path(@link)
  end
end
