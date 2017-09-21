class ArticlesController < ApplicationController
	#GET /articles
	def index
    # All field from Article (SELECT * FROM articles)
		@articles = Article.all
	end
	#GET /articles/:id
	def show
		@article = Article.find(params[:id])
	end

	#GET /articles/new
	def new
    @article = Article.new
	end
  # POST /articles
  def create
    # INSERT INTO
    @article = Article.new(title: params[:article][:title],
                            body: params[:article][:body])
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  # DELETE /articles/:id
  def destroy
    # DELETE FROM  articles
    @article = Article.find(params[:id])
    @article.destroy # Destroy: Delete object from Data Base
    redirect_to articles_path
  end

  # PUT /articles/:id
  def update
    # UPDATE
    # @article.update_attributes({title: 'New Titile'})
  end
end
