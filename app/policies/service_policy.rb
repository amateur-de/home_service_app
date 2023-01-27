# frozen_string_literal: true

class ServicePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.seller?
  end

  def new?
    @user.seller?
  end

  def create?
    @user.seller?
  end

  def edit?
    @user.seller? or @user.moderator? or @user.customer?
  end

  def update?
    @user.seller? or @user.moderator? or @user.customer?
  end

  def destroy?
    @user.seller?
  end

  def pending?
    @user.moderator?
  end

  def approved?
    @user.moderator?
  end

  def rejected?
    @user.moderator?
  end

  def available?
    @user.customer?
  end

  def availed?
    @user.customer?
  end
end
