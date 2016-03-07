class ProfilesController < ApplicationController
  before_action :retrive_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, except: [:index, :show]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    respond_to do |format|
      if params[:available]
        format.html { @profiles = Profile.where(availability: true).page(params[:page]).per(2) }
        format.js   { @profiles = Profile.where(availability: true).page(params[:page]).per(2)
                      render :home_fadeout}
      elsif params[:all]
        format.html { @profiles = Profile.where(all: true).page(params[:page]).per(2) }
        format.js   { @profiles = Profile.where(all: true).page(params[:page]).per(2)
                      render :home_fadeout }
      else
        format.html { @profiles = Profile.all.page(params[:page]).per(2) }
        format.js   { @profiles = Profile.all.page(params[:page]).per(2)
                      render :home_fadein}
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
      render :edit
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
