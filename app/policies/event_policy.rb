class EventPolicy < ApplicationPolicy

  def new?
    user.admin? or record.ministry.editors.include?(user)
  end

  def create?
    user.admin? or record.ministry.editors.include?(user)
  end

  def update?
    user.admin? or record.ministry.editors.include?(user)
  end

  def edit?
    user.admin? or record.ministry.editors.include?(user)
  end

  def destroy?
    user.admin? or record.ministry.editors.include?(user)
  end
end
