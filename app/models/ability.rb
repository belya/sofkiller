class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      prepare_novice_abilities(user)
      prepare_user_abilities(user) unless user.novice?
      prepare_admin_abilities(user) if user.admin?
    end
  end

  private 
    def prepare_novice_abilities(user) 
      can :read, :all
      cannot :read, User
      can :manage, User, id: user.id
      cannot :change_status, User
    end

    def prepare_user_abilities(user)
      can :manage, Question, user_id: user.id
      can :manage, Answer, user_id: user.id
    end

    def prepare_admin_abilities(user)
      can :manage, :all
      can :change_status, User
    end
end
