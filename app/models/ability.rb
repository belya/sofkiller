class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Category
    if user
      prepare_user_abilities(user)
      prepare_admin_abilities(user) if user.admin?
    end
  end

  private 
    def prepare_user_abilities(user)
      can :read, :all
      can :manage, Question, user_id: user.id
      can :manage, Answer, user_id: user.id
      can :manage, User, id: user.id
    end

    def prepare_admin_abilities(user)
      can :manage, :all
    end
end
