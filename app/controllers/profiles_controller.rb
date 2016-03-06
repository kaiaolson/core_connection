class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, except: [:index, :show]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    respond_to do |format|
      if params[:available]
        format.html { @profiles = Profile.where(availability: true) }
        format.js { @profiles = Profile.where(availability: true)
                    render :transition_home}
      elsif params[:all]
        format.html { @profiles = Profile.all }
        format.js { @profiles = Profile.all
                    render :transition_home }
      else
        format.html { @profiles = Profile.all }
        format.js { @profiles = Profile.all }
      end
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
    @skill = Skill.new
    @education = Education.new
    @experience = Experience.new
    @project = Project.new
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

  def authorize_user
    unless can? :manage, @profile
      redirect_to root_path, alert: "ACCESS DENIED!"
    end
  end
end
