class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to posts_path, notice: "Category Created"
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(params[:post].permit(:name))
      redirect_to @categories
    else
      render 'edit'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
