class CommentsController < ApplicationController
    
  def new
  end
  
  def create
    @link = Link.find(params[:link_id])
    Comment.new(params[:comment].permit(:comment)) do |c|
      c.score = 0
      c.user = current_user
      c.link = @link
      c.save
    end
    redirect_to link_path(@link)
  end
  
  def destroy
    set_link_and_comment
    @comment.destroy
    redirect_to link_path(@link)
  end

  def vote_up
    set_link_and_comment
    @comment.vote_up
    redirect_to link_path(@link)
  end
  
  def vote_down
    set_link_and_comment
    @comment.vote_down
    redirect_to link_path(@link)
  end
  
private
  def set_link_and_comment
    @link = Link.find(params[:link_id])
    @comment = Comment.find(params[:id])
  end
  
end
