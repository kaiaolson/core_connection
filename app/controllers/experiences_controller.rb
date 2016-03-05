class ExperiencesController < ApplicationController
  def create
    @experience = Experience.new experience_params
    @profile = current_user_profile
    @experience.profile_id = @profile

    if @experience.save
      redirect_to profile_path(@profile), notice: "Work experience added!"
    else
      flash[:alert] = "Error adding work experience!"
      render new_profile_link(@profile)
    end
  end

  def update
    @profile = current_user_profile
    @experience = Experience.find params[:id]

    if @experience.update experience_params
      redirect_to profile_path(@profile), notice: "Work experience updated!"
    else
      flash[:alert] = "Error updating experience!"
      render new_profile_link(@profile)
    end
  end

  def destroy
    @profile = current_user_profile
    @experience = params[:id]

    @experience.destroy
    redirect_to profile_path(@profile)
  end

  private

  def experience_params
    params.require(:experience).permit(:job_title, :description, :company_url, :image, :from_date, :to_date, :profile_id, :company_name)
  end

end
