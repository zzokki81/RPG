class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    return unless user.present?

    can [:profile, :edit, :destroy], User, id: user.id
    can [:create, :update, :destroy], Character, user_id: user.id
    can [:create, :update, :destroy], CharAttribute, character: { user_id: user.id }
  end
end
