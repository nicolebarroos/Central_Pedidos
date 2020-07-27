# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    can :dashboard, :all
      can :access, :rails_admin
      can :read, :dashboard
      can :manage, :all

  end
end
