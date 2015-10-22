class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: 3)
    if user.admin?
        can :manage, :all
    elsif user.editor?
        can :read, :all
        can :create, :all
        can :update, [Movie, Review]
        can :destroy, [Movie, Review], user_id: user.id
        can [:set_genre, :set_genres], Movie
        can :like, [Movie, Review]
    elsif user.basic?
        can :read, :all
        can :create, [Movie, Review]
        can [:update, :destroy], [Movie, Review], user_id: user.id
        can :set_genre, Movie, user_id: user.id
        can :like, [Movie, Review]
    else
        can :read, :all
    end
end
end
