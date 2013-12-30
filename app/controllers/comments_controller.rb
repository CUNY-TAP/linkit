class CommentsController < ApplicationController
  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.create(params[:comment].permit(:body))
    @comment.commenter = current_user.email
    @comment.save
    redirect_to link_path(@link)
  end

  def destroy
    @link = Link.find(params[:link_id])
    @comment = @link.comments.find(params[:id])
    @comment.destroy
    redirect_to link_path(@link)
  end

  def upvote
  	@link = Link.find(params[:link_id])
  	@comment = @link.comments.find(params[:comment_id])
  	@comment.score+=1
    @comment.save
    @comment.link.my_score
  	redirect_to link_path(@link)
  end

  def downvote
  	@link = Link.find(params[:link_id])
  	@comment = @link.comments.find(params[:comment_id])
  	@comment.score-=1
  	@comment.save
    @comment.link.my_score
  	redirect_to link_path(@link)
  end
end
