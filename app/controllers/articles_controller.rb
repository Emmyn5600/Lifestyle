class ArticlesController < ApplicationController
  def index
    @categories = Category.all
    @articles = Article.all

    cool = params[:cool]
    @articles = if cool.nil?
                  Article.all
                else
                  Article.where(category_id: cool)
                end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article_id
  end

  def new
    @article = Article.new
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

  private

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [])
  end
end
