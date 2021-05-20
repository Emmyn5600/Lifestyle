class ArticlesController < ApplicationController
  def index; end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      flash.notice = 'Article created successfully!'
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @article = Article.includes(:comments, :user).find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article_id
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [])
  end
end
