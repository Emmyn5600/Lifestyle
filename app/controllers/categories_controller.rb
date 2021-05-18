class CategoriesController < ApplicationController
    before_action :authenticate, only: %i[index]
  
    def index
      @categories = Category.order('priority ASC').includes(:articles).select do |e|
        e.articles.count.positive?
      end
      if Vote.count.positive?
        @vote = Vote.all.group(:article_id).count.max_by { |_k, v| v }.first
        @article = Article.find(@vote)
      elsif Article.count.positive?
        @article = Article.first
      else
        redirect_to new_category_path
      end
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(category_params)
      if @category.save
        flash.notice = 'Category created successfully!'
        redirect_to root_path
      else
        render :new
      end
    end
  
    def show
      @category = Category.includes(articles: :user).find(params[:id])
    end
  
    private
  
    def category_params
      params.require(:category).permit(:name, :priority)
    end
  end
  