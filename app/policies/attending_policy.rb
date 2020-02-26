class AttendingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
    # record.user == user
  end

  def create?
    true
    # record.user == user
  end

  def destroy?
    record.user == user
  end
end
