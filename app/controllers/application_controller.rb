class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :allPostsFromLast
  before_action :allCategories

  def allPostsFromLast
  @posts = Post.all.order('created_at DESC')
  end

  def allCategories
    @categories = Category.all.order('name')
  end
end
