class ExperiencesController < ApplicationController

  before_action :find_experience, only: [:edit, :update, :destroy]
  before_action :find_profile, only: [:edit, :update, :destroy]
  before_action :authenticate_user
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def create
    @experience = Experience.new experience_params
    @experience.profile = current_user_profile
    if @experience.save
      redirect_to edit_profile_path(current_user_profile), notice: "Work experience added!"
    else
      flash[:alert] = "Error adding work experience!"
      redirect_to edit_profile_path(current_user_profile)
    end
  end

  def edit
  end

  def update
    if @experience.update experience_params
      redirect_to profile_path(current_user_profile), notice: "Work experience updated!"
    else
      flash[:alert] = "Error updating experience!"
      render new_profile_experience(@profile)
    end
  end

  def destroy
    @experience.destroy
    redirect_to profile_path(@profile)
  end

  private

  def find_experience
    @experience = Experience.find params[:id]
  end

  def experience_params
    params.require(:experience).permit(:job_title, :description, :company_url, :image, :from_date, :to_date, :company_name)
  end

  def user_from_request
    Profile.find_by_id(params[:profile_id]).user
  end

  def authorize_user
    if !(can? :manage, @experience) || !((user_from_request == current_user) || (current_user.admin))
      redirect_to root_path, alert: "ACCESS DENIED"
    end
  end

end
