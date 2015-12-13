class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :set_question, only: [:new, :create]
  load_and_authorize_resource :category
  load_and_authorize_resource :question, through: :category
  load_and_authorize_resource :answer, through: :question
  
  def new
    @answers = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    respond_to do |format|
      if @answer.save
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
      if @answer.update(answer_params)
        format.html { redirect_to answer.question }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url }
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:question_id, :user_id, :text);
    end

    def set_answer
      @answer = Answer.find(params[:id]);
    end

    def set_question
      @question = Question.find(params[:question_id])
    end
end
