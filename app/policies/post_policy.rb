class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present? 
  end
  
  def destroy?
    user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator))
  end
  
  def update?
    create?
  end
  
end