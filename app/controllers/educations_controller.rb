class EducationsController < ApplicationController

  before_action :find_education, only: [:edit, :update, :destroy]
  before_action :find_profile, only: [:edit, :update, :destroy]
  before_action :authenticate_user
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def create
    @education = Education.new education_params
    @education.profile = current_user_profile
    if @education.save
      redirect_to edit_profile_path(current_user_profile), notice: "Education added!"
    else
      flash[:alert] = "Error adding education!"
      redirect_to edit_profile_path(current_user_profile)
    end
  end

  def edit
  end

  def update
    if @education.update education_params
      redirect_to profile_path(current_user_profile), notice: "Education updated!"
    else
      flash[:alert] = "Error updating education!"
      render new_profile_education(@profile)
    end

  end

  def destroy
    @education.destroy
    redirect_to profile_path(@profile)
  end

  private

  def find_education
    @education = Education.find params[:id]
  end

  def education_params
    params.require(:education).permit(:school, :image, :description, :school_url, :degree, :profile_id)
  end

  def user_from_request
    Profile.find_by_id(params[:profile_id]).user
  end

  def authorize_user
    if !(can? :manage, @education) || !((user_from_request == current_user) || (current_user.admin))
      redirect_to root_path, alert: "ACCESS DENIED"
    end
  end
end
