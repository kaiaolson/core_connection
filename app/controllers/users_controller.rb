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
      if current_user.admin
        UsersApprovalMailer.send_approval(@user).deliver_now
        redirect_to users_path, notice: "User approved"
      else
        redirect_to profile_path(current_user_profile), notice: "User updated successfully."
      end
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

  def edit_password
    @user = User.find params[:id]
  end

  def update_password
     @user = User.find params[:id]
  if @user.authenticate(user_params[:current_password]) && @user.update(edit_password_params)
    redirect_to root_path, notice: "You have changed your password"
  else
    flash.now[:alert] = "make sure password is correct"
    render :edit_password
  end
end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :status, :admin, :current_password)
  end

  def edit_password_params
    params.require(:user).permit([:current_password, :password, :password_confirmation])
  end


end
