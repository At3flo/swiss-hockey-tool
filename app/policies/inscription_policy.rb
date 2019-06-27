class InscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def destroy?
    user.role == "admin" || record.club_id == user.club_id
  end

end
