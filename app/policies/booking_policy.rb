# frozen_string_literal: true

class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    @user.customer?
  end

  def create?
    @user.customer?
  end

  def show?
    @user.customer?
  end

  def edit?
    @user.customer?
  end

  def update?
    @user.customer?
  end

  def destroy?
    @user.customer?
  end
end
