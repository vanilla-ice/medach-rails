class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :manage, Article

      if user.admin?
        can :manage, :all
      end
    end
  end
end
