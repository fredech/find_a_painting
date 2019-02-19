class PaintingPolicy < ApplicationPolicy

  def show?
    true
  end

  def new?
    true
  end

  def create?
    user_is_owner_or_admin?
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin?
  end
end
