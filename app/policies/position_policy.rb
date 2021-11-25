class PositionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def destroy?
    record.dashboard.user == user
  end
end
