class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update, :destroy]

  def index
    if params[:available]
      @profiles = Profile.where(availability: true)
    else
      @profiles = Profile.all
    end
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new profile_params
    @profile.user = current_user
    if @profile.save
      redirect_to profile_path(@profile), notice: "Profile created"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @profile = Profile.find params[:id]
    if @profile.update profile_params
      redirect_to profile_path(@profile), notice: "Profile updated."
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:tagline, :description, :availability, :resume, :photo, :twitter_url, :linkedin_url, :github_url)
  end

  def find_profile
    @profile = Profile.find params[:id]
  end
end
