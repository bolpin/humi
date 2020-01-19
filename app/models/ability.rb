# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    else
      can :read, Donation
      can :read, Disbursement
    #   can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"
    end
  end
end
