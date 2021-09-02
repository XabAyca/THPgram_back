class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show update destroy ]
  before_action :set_article, only: %i[ create index ]
  before_action :authenticate_user!
  before_action :is_creator?, only: %i[ update destroy ]

  def index 
    @comments = Comment.all.filter{|comment| comment.article_id == @article.id}
    p @comments
    render json: @comments
  end

  def show
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.article_id = @article.id
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
     render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.destroy
      render json: {
        comment:{
          detail:"delete"
        }
      }
    end
  end

  private #****************************** Private ******************************#

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def is_creator?
    if @comment.user != current_user
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

  def comment_params
    params.require(:comment).permit(:content)
  end

end