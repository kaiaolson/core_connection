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
    # TODO add other models like skills, etc
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    respond_to do |format|
      if @user.update user_params
        format.html { redirect_to user_path(@user), notice: "Profile updated" }
        format.js   { render :update_user }
      else
        format.html { flash[:alert] = "Update failed!"
                      render :edit }
        format.js   { render :update_failed }
      end
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
