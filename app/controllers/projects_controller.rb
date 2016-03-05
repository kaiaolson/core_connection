class ProjectsController < ApplicationController

  before_action :find_project, only: [:update, :destroy]

  def create
    @project = Project.new project_params
    @profile = current_user_profile
    if @project.save
      membership = Membership.new(project_id: @project.id, profile_id: @profile)
      # Add logic for checking to see if membership exists here.
      membership.save
      redirect_to profile_project_path(@project), notice: "Project added."
      else
      render :new
    end
  end

  def update
    if @project.update project_params
      # redirect_to (question_path(@question), {notice: "Question updated!"})
      redirect_to profile_project_path(@project), notice: "Project added"
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to profile_projects_path, notice: "Project removed"
  end

  private

  def find_project
    Project.find params[:project_id]
  end

  def project_params
    params.require(:project).permit(:title, :description, :project_url, :github_url)
  end

end
