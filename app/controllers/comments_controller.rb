class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy, :up_vote, :down_vote]
  # skip_before_filter  :authenticate_user!, only: [:index, :show]

  # GET /comments
  # GET /comments.json
  def index
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @link = Link.new
  end

  # GET /comments/1/edit
  def edit
  end

  # UPDATE /comments/1/up_vote
  def up_vote
    @comment.score = 0 if @comment.score.nil?
    @comment.score = @comment.score + 1
  
    respond_to do |format|
      if @comment.save
        format.html { redirect_to link_path(@comment.link), notice: "Comment successfully upvoted!"}
      else
        format.html { redirect_to link_path(@comment.link), error: "Comment failed to up vote."}
      end
    end
  end

  # UPDATE /comments/1/up_vote
  def down_vote
    @comment.score = 0 if @comment.score.nil?
    @comment.score = @comment.score - 1

    respond_to do |format|
      if @comment.save
        format.html { redirect_to link_path(@comment.link), notice: "Comment successfully downvoted!"}
      else
        format.html { redirect_to link_path(@comment.link), error: "Comment failed to down vote."}
      end
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.link, notice: 'Comment was successfully posted.' }
        format.json { render action: 'show', status: :created, location: @comment.link }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to link_path(@comment.link), notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to link_path(@comment.link) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:text, :link_id)
    end
end
