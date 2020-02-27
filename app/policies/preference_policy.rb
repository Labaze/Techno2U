class PreferencePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    record.user == user
  end

  def show?
    record.user == user
  end

  def create?
    record.user == user
  end

  def new?
    # create?
    true
  end

  def update?
    # record.user == user
    true
  end

  def edit?
    update?
  end

  def destroy?
    record.user == user
  end
end
