class ArticlesController < ApplicationController
	def index
		@articles = Article.all #fetching all the articles
	end #index method

	def show
		@article = Article.find(params[:id])
	end #show method

	def new
		@article = Article.new
	end #new method

	def create
		@article = Article.new(article_parameters)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end #create method

	def edit
		@article = Article.find(params[:id])
	end #edit method

	def update
		@article = Article.find(params[:id])
		if (@article.update(article_parameters))
			redirect_to @article
		else
			render 'edit'
		end
	end #update method

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end #destroy method

	def not_found
		raise ActionController::RoutingError.new('Not Found')
	end

	private
		def article_parameters
			params.require(:article).permit(:title, :body)
		end
end
