class CommentsController < ApplicationController
  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.create(params[:comment].permit(:commenter, :body, :score))
    redirect_to link_path(@link)
  end

  def upvote
  	@link = Link.find(params[:link_id])
  	@comment = Comment.find(params[:comment_id])
  	@comment.score+=1
  	@comment.save
  	redirect_to link_path(@link)
  end

  def downvote
  	@link = Link.find(params[:link_id])
  	@comment = Comment.find(params[:comment_id])
  	@comment.score-=1
  	@comment.save
  	redirect_to link_path(@link)
  end
end