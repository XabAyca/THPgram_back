class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show update destroy ]
  before_action :authenticate_user!
  before_action :is_creator?, only: %i[ update destroy ]

  def index 
    @articles = Article.all_public

    render json: @articles
  end

  def show
    render json: @article
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
     render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @article.destroy
      render json: {
        article:{
          detail:"delete"
        }
      }
    end
  end

  private #****************************** Private ******************************#

  def set_article
    @article = Article.find(params[:id])
  end

  def is_creator?
    if @article.user != current_user
      render json: {
      'errors': [
        {
          'status': '401',
          'title': 'Unauthorized'
        }
      ]
    }, status: 401
    end
  end

  def article_params
    params.require(:article).permit(:stream,:description,:private)
  end

end