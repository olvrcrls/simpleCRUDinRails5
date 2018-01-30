class ArticlesController < ApplicationController
	# before_action takes place before the method is being called
	# referencing a private method that will first be used
	# :only is for the specific methods that are scoped by the `before_action`
	
	before_action :find_book, only: [:show, :update, :edit, :destroy]
	def index
		@articles = Article.all #fetching all the articles
	end #index method

	def show
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
	end #edit method

	def update
		if (@article.update(article_parameters))
			redirect_to @article
		else
			render 'edit'
		end
	end #update method

	def destroy
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

		def find_book
			@article = Article.find(params[:id])
		end
end
