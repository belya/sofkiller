class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_category

  def index
    @questions = Question.where(search_question_params)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
    end
  end

  private
    def search_question_params
      params.permit(:category_id, :user_id);
    end

    def question_params
      params.permit(:category_id, :user_id, :text);
    end

    def set_question
      @question = Question.find(params[:id]);
    end

    def set_category
      @category = Category.find(params[:category_id])
    end
end
