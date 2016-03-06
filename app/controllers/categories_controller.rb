class CategoriesController < ApplicationController
  # We will need to implement it when we decide to make an admin paged
  before_action :find_category, only: [:show, :update, :edit, :destroy]

  def new
    @category = Category.new
  end

  def create
    # category_name = params["category"]["name"]
    @category = Category.new category_params
    if @category.save
      flash[:notice] = "Category Saved Successfully"
      redirect_to new_category_path(@category)
    else
      flash[:alert] = "Category could not be saved"
      render :new
    end
  end

  def index
    @categories = Category.order("created_at DESC")
  end

  def edit

  end

  def update
    if @category.update category_params
      flash[:notice] = "Category updated Successfully"
      redirect_to category_path(@category)
    else
      flash[:alert] = "Category could not be Updated"
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Category removed successfully"
  end

  private

  def find_category
    @category = Category.find params[:id]
  end

  def category_params
    params.require(:category).permit([:name])
  end
end
