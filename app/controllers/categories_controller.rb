class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
    end
  end

  private

    def category_params
      params.require(:category).permit(:title)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end
