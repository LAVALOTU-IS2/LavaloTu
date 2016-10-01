class UserPolicy < ApplicationPolicy
  def index?
  	user.Admin?
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
