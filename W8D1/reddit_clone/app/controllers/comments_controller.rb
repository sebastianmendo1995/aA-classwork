class CommentsController < ApplicationController

  before_action :require_logged_in

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user_id
    @comment.post_id = params[:post_id]
    @comment.save
    flash[:errors] = @comment.errors.full_messages
    redirect_to post_url(@comment.post_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
