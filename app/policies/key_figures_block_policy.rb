class KeyFiguresBlockPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def create?
      return true
    end

    def update?
      record.dashboard.user == user
    end

    def destroy?
      record.dashboard.user == user
    end

    def show?
      record.dashboard.user == user
    end
end
