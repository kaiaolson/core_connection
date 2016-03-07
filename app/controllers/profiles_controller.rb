class ProfilesController < ApplicationController
  before_action :retrive_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, except: [:index, :show]
  before_action :authorize_user, only: [:edit, :update, :destroy]

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
      redirect_to edit_profile_path(@profile), notice: "Profile created"
    else
      render :new
    end
  end

  def show
  end

  def edit
    @skill = Skill.new
    @education = Education.new
    @experience = Experience.new
    @project = Project.new
  end

  def update
    @profile = Profile.find params[:id]
    if @profile.update profile_params
      redirect_to profile_path(@profile), notice: "Profile updated."
    else
      puts @profile.errors.full_messages
      redirect_to edit_profile_path(@profile), notice: "Profile not updated!"
    end
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:tagline, :description, :availability, :resume, :photo, :twitter_url, :linkedin_url, :github_url)
  end

  def retrive_profile
    @profile = Profile.find params[:id]
  end

  def authorize_user
    unless can? :manage, @profile
      redirect_to root_path, alert: "ACCESS DENIED!"
    end
  end
end
