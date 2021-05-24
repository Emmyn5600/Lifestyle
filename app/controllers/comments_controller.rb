class CommentsController < ApplicationController
  before_action :authenticate, only: %i[create]

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.user_id = current_user.id

    @comment.save
    flash.notice = 'Your comment has been added'
    redirect_to article_path(@comment.article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
