class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.where(search_category_params)
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
        format.html { render :new }
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
    def search_category_params
      params.permit(:category_id, :user_id);
    end

    def category_params
      params.permit(:category_id, :user_id, :text);
    end

    def set_category
      @category = Category.find(params[:id]);
    end
end
