class EducationsController < ApplicationController
  def create
    @profile = current_user_profile
    @education = Education.new education_params
    @education.profile_id = @profile

    if @education.save
      redirect_to profile_path(@profile), notice: "Education added!"
    else
      flash[:alert] = "Error adding education!"
      render new_profile_link(@profile)
    end

  end

  def edit
    @profile = current_user_profile
    @education = Education.find params[:id]
  end

  def update
    @profile = current_user_profile
    @education = Education.find params[:id]

    if @education.update education_params
      redirect_to profile_path(@profile), notice: "Education updated!"
    else
      flash[:alert] = "Error updating education!"
      render new_profile_link(@profile)
    end

  end

  def destroy
    @profile = current_user_profile
    @education = params[:id]

    @education.destroy
    redirect_to profile_path(@profile)
  end

  private

  def education_params
    params.require(:education).permit(:school, :image, :description, :school_url, :degree, :profile_id)
  end
end
