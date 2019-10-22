# Controller File
class UsersController < ApplicationController
  before_action :user_details, only: %i[show update edit destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def user_details
    @user = User.find_by(id: params[:id])
    
  end
end
