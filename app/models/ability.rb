class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end

    # If you own the profile you can manage it
    can :manage, Profile do |profile|
      profile.user == user
    end

    # if current_user_profile.user == user
    #   byebug
    #   can :manage, Education
    # end
  end
end
