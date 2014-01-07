class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.account_type == "admin"
      can :manage, :all
    end
    
    if user.account_type == nil
      can :read, Trackpoint
      can :read, BusStop
      can :read, Device
    end
  end
end
