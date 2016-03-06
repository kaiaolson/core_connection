class UsersController < ApplicationController

  def index
    @pending_users = User.where(status: false)
    @approved_users = User.where(status: true)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: "User created" }
        format.js   { render :create_pending }
      else
        format.html { render :new }
        format.js   { render :create_failure }
      end
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
    if @user.update(status: params[:status])
      redirect_to user_path(@user), notice: "Profile updated successfully."
    else
      flash[:notice] = "Profile not updated."
      print @user.errors.full_messages
      redirect_to users_path
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
