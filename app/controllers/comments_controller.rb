#comments_controller.rb
class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find_by_id(params[:id])
	end

	def new
		@comment = Comment.new
	end

	def voteUp
		@comment = Comment.find_by_id(params[:id])
		@comment.voteUp
		respond_to do |format|
			if @comment.save
				format.html { redirect_to @comment.link, notice: 'Voting Up was successfull.' }
			else
				format.html { redirect_to @comment.link, notice: 'Voting Up was unsuccessfull.' }
			end
		end
	end


	def voteDown
		@comment = Comment.find_by_id(params[:id])
		@comment.voteDown
		respond_to do |format|
			if @comment.save
				format.html { redirect_to @comment.link, notice: 'Voting Down was successfull.' }
			else
				format.html { redirect_to @comment.link, notice: 'Voting Down was unsuccessfull.' }
			end
		end
	end

	def create
		@comment = Comment.new
		@comment.text = params[:comment][:text]
		@comment.score = 0
		@comment.link_id = params[:comment][:post_id]
		respond_to do |format|
			if @comment.save 
				@comment.reload

				format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
			
			else
				format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end


	def destroy
		@comment = Comment.find_by_id(params[:id])
		link = @comment.link
		@comment.destroy
		
		link.updateScore
		respond_to do |format|
			format.html { redirect_to comments_url }
			format.json {head :no_content }
		end
	end
end
