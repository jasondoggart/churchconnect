class MemoryVersePolicy < ApplicationPolicy
  def create?
    user.admin?
  end

  def new?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def edit?
    user.admin?
  end
end
