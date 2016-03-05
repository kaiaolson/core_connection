class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to user_path(@user), notice: "User created"
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
    # TODO add other models like skills, etc
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      redirect_to user_path(@user), notice: "Profile updated"
  end


  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :status, :admin)
  end
end
