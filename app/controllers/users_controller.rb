class UsersController < ApplicationController

  def index
    @pending_users = User.where(status: false, admin: false)
    @approved_users = User.where(status: true, admin: false)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in(@user)
      redirect_to new_profile_path, notice: "User created"
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      redirect_to profile_path(current_user_profile), notice: "User updated successfully."
    else
      flash[:notice] = "User not updated."
      render :edit
    end
  end


  def destroy
    @user = User.find params[:id]
    dependent_profile = Profile.find_by_user_id(@user)
    dependent_profile.destroy
    @user.destroy
    redirect_to users_path, notice: "User deleted successfully!"
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :status, :admin)
  end

end
