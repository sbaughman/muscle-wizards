class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Prep, user_id: user.id
    can :read, Prep, coach_id: user.id
    can :read, User
  end

end
