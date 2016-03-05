class SkillsController < ApplicationController
  before_action :find_skill, only: [:show, :edit, :update, :destroy]

  def new
    @skill = Skill.new
  end

  def index
    @skills = Skill.order("order by created_at DESC")
  end

  def create
    @skill = Skill.new skill_params
    @skill.user = current_user_profile
    if @skill.save
      flash[:notice] = "Skill created successfully"
      redirect_to new_profile_skill_path(@skill), notice: "Skill has been created!"
    else
      flash.now[:alert] = "Skill wasn't created. Check errors below"
      render :new
    end
  end

  def edit

  end

  def update
    if @skill.update skill_params
      redirect_to profile_skill_path(@skill), notice: "Skill has been updated!"
    else
      flash.now[:alert] = "Skill could not be updated!"
      render :edit
    end
  end

  def destroy
    @skill.destroy
    redirect_to profile_skills_path, alert: "Skill has been removed!"
  end

  private

  def find_skill
    @skill = Skill.find params[:id]
  end

  def skill_params
    skill_params = params.require(:skill).permit([:name, :category_id])
  end
end
