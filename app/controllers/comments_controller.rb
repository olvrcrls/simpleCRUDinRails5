class CommentsController < ApplicationController
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comment.create(comment_parameters)
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comment.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private
		def comment_parameters
			params.require(:comment).permit(:commenter, :body)
		end
end
