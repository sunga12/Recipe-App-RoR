class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    return unless user.present?

    can :manage, Recipe, user_id: user.id
    can :manage, Food, user_id: user.id
  end
end
