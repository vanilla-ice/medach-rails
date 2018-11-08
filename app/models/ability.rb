class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can [:read, :create], Article
      can :read, User
      can :update, User do |u|
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
