class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:new, :create]
  load_and_authorize_resource :category
  load_and_authorize_resource :question, through: :category

  def index
    case params[:with_answers]
    when '1'
      @questions = Question.answered
    when '0'
      @questions = Question.not_answered
    else
      @questions = Question.all
    end
  end

  def new
    @question = Question.new(params.permit(:category_id))
    @question.user = current_user
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: "Question successfully created" }
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
        format.html { redirect_to @question, notice: "Question successfully updated" }
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
      format.html { redirect_to @question.category, notice: "Question successfully deleted" }
    end
  end

  private

    def question_params
      params.require(:question).permit(:category_id, :user_id, :text)
    end

    def set_question
      @question = Question.find(params[:id])
    end

    def set_category
      @category = Category.find(params[:category_id])
    end
end
