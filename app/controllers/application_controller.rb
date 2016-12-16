class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :allPostsFromLast

  def allPostsFromLast
  @posts = Post.all.order('created_at DESC')
  end
end
