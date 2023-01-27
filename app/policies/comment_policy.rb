# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.seller? or @user.moderator?
  end

  def new?
    @user.moderator?
  end

  def create?
    @user.moderator?
  end
end
