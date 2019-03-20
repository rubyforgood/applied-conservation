class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:users).where('user_id = ?', user.id)
    end
  end
end
