class UsersController < ApplicationController

  def index
    @users = User.all
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
    # TODO add other models like skills, etc
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      redirect_to profile_path(current_user_profile), notice: "Profile updated"
    else
      flash[:alert] = "Update failed!"
      render :edit
    end
  end

  # Do we need #destroy?
  # def destroy
  # end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :status, :admin)
  end

end
