class SkillsetsController < ApplicationController
  def new
  end

  def create
    @profile = Profile.find params[:profile_id]
    @skill = Skill.find params[:skill_id]
    skillset = Skillset.new (profile: @profile, skill: @skill )
    if skillset.save
      redirect_to @profile, notice: "Skillset has been added"
    end
  end

end
