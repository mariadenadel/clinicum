class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_admin?
      can :manage, :all
    else
      can :read, :all
      cannot :manage, DiagnosisItem
    end
  end
end
