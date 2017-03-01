class CommentsController < ApplicationController
  before_action :authenticate_admin_user, only: :destroy
  before_action :get_post
  before_action :get_comment, only: :destroy
  before_action :comment_params

  def create
    @comment = @post.comments.new(comment_params)
    @comment.admin_id = current_admin.id if current_admin
    @comment.user_id = current_user.id if current_user
    if @comment.save
      redirect_to @post, notice: 'Yorumun paylaşıldı'
    else
      redirect_to @post, notice: 'Yorum başarısız'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @post, notice: 'Yorum silindi'
  end

  private
  def get_post
    @post = Post.find(params[:post_id])
  end

  def get_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id, :admin_id, :user_id)
  end

  def authenticate_admin_user
    redirect_to request.env['PATH_INFO'], notice: 'Do not touch comment whose anotherone' unless @comment.user_id == current_user.id if current_user
    redirect_to request.env['PATH_INFO'], notice: 'Do not touch comment whose anotherone' unless @comment.admin_id == current_admin.id if current_admin
  end
end
