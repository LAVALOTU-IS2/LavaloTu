class UserPolicy < ApplicationPolicy
  def index?
  	user.Admin?
  end
  def destroy?
  	user.Admin?
  end
  def laundry?
    user.Laundry?
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
