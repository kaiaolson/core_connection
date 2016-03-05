class LinksController < ApplicationController

  def new
    # @profile = Profile.find params[:profile_id]
    @profile = current_user_profile
    @link = Link.new (profile_id: @profile)
  end

  def create
    # @profile = Profile.find params[:profile_id]
    @profile = current_user_profile

    if @link = Link.create link_params
      redirect_to profile_path(@profile), notice: "Link added"
    else
      flash[:alert] = "Error adding link!"
      render new_profile_link(@profile)
    end

  end

  def update
    # @profile = Profile.find params[:profile_id]
    @profile = current_user_profile
    @link = Link.find params[:id]

    if @link.update link_params
      redirect_to profile_path(@profile), notice: "Link updated"
    else
      flash[:alert] = "Error updating link!"
      render new_profile_link(@profile)
    end

  end

  # We won't destroy a link, we'll set its url to nil/emptry string instead
  # def destroy
  # end

  def link_params
    params.require(:link).permit(:github_url, :linkedin_url, :twitter_url, :profile_id)
  end
end
