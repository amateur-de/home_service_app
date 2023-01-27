# frozen_string_literal: true

class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.customer?
  end

  def new?
    @user.customer?
  end

  def create?
    @user.customer?
  end

  def destroy?
    @user.customer?
  end
end
