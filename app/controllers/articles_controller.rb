class ArticlesController < ApplicationController
  # before_action :validate_user, except: [:show, :index]
  before_action :authenticate_user!, except: [:show,:index]
  before_action :set_article, except: [:index,:new,:create]

  #GET /articles
	def index
    # All field from Article (SELECT * FROM articles)
		@articles = Article.all
	end
	#GET /articles/:id
	def show
		# @article = Article.find(params[:id])
    @article.update_visits_count
	end

	#GET /articles/new
	def new
    @article = Article.new
	end


  def edit
    # @article = Article.find(params[:id])
  end

  # POST /articles
  def create
    # INSERT INTO
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  # DELETE /articles/:id
  def destroy
    # DELETE FROM  articles

    @article.destroy # Destroy: Delete object from Data Base
    redirect_to articles_path
  end

  # PUT /articles/:id
  def update
    # UPDATE
    # @article.update_attributes({title: 'New Titile'})
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  private
    def set_article
      #code
      @article = Article.find(params[:id])
    end
    def validate_user
      #code
      redirect_to new_user_session_path, notice: "You Need to Start Session"
    end
    def article_params
      params.require(:article).permit(:title,:body)
    end
end
