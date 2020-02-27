class LineupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    true
    # user.admin?
  end

  def destroy?
    user.admin?
  end
end
