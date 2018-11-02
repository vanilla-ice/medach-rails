class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :manage, Article
      can [:update, :read], User do |u|
        u.id == user.id
      end

      if user.admin?
        can :manage, :all
      end
    end
  end
end
