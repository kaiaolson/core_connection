class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new profile_params
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
    params.require(:profile).permit(:tagline, :description, :availability, :resume, :photo)
  end

  def find_profile
    @profile = Profile.find params[:id]
  end
end
