class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :read, Article
      can [:update, :show], User do |u|
        u.id == user.id
      end
      can [:update, :edit], Article do |a|
        a.user_id == user.id
      end

      if user.admin?
        can :manage, :all
      end
    end
  end
end
