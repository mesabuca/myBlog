class PostsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]


  def index
    @paginatedPosts = Post.all.order('created_at DESC').page(params[:page]).per('7')
  end

  def new
    @post = Post.new
  end

  def create
    @post  = Post.new(post_params)
    @post.admin_id = current_admin.id if current_admin
    if @post.save
      redirect_to @post, notice: "Post Created"
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render 'edit'
		end
  end


  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path(anchor:"posts")
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
