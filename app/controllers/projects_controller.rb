class ProjectsController < ApplicationController

  before_action :find_project, only: [:edit, :update, :destroy]
  before_action :find_profile, only: [:edit, :update, :destroy]
  before_action :authenticate_user
  before_action :authorize_user, only: [:edit, :update, :destroy]


  def create
    @project = Project.new project_params
    @project.profile = current_user_profile
    if @project.save
      redirect_to edit_profile_path(current_user_profile), notice: "Project added."
      else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update project_params
      redirect_to profile_path(@profile), notice: "Project updated"
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to profile_path(@profile), notice: "Project removed"
  end

  private

  def find_project
    @project = Project.find params[:id]
  end

  def project_params
    params.require(:project).permit(:title, :description, :project_url, :github_url)
  end

  def user_from_request
    Profile.find_by_id(params[:profile_id]).user
  end

  def authorize_user
    if !(can? :manage, @project) || !((user_from_request == current_user) || (current_user.admin))
      redirect_to root_path, alert: "ACCESS DENIED"
    end
  end

end
