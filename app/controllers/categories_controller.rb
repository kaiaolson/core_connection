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
      redirect_to categories_path
    else
      flash[:alert] = "Category could not be saved"
      render :new
    end
  end

  def index
    @categories = Category.order("created_at DESC")
    @category = Category.new
  end

  def edit

  end

  def update
    respond_to do |format|
      if @category.update category_params
        format.html{redirect_to category_path(@category), notice: "Category updated Successfully"}
        format.json {respond_with_bip(@category)}
      else
        # flash[:alert] = "Category could not be Updated"
        format.json {respond_with_bip(@category)}
        format.html{render :edit}
      end
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
