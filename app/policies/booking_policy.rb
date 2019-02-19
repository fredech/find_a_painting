class BookingPolicy < ApplicationPolicy

  def show?
    user_is_owner_or_admin?
  end

  def create?
    true
  end

  def update?
    user_is_owner_or_admin?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)or(scope.where(user: painting.user))
      end
    end
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin?
  end
end
