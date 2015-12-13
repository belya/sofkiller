class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  load_and_authorize_resource 
  
  def index
    @users = User.all
  end

  def show
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user }
      else
        format.html { render :edit }
      end
    end
  end

  private 

    def set_user
      @user = User.find(params[:id]);
    end

    def user_params
      if can? :change_status, @user
        params.require(:user).permit(:name, :status)
      else
        params.require(:user).permit(:name)
      end
    end
end
