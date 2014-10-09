class PagePolicy < ApplicationPolicy
  attr_reader :user, :page

  def index?
    true
  end

  def create?
    user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator)) 
  end
  
  def destroy?
    user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator))
  end
  
  def update?
    user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator))
  end
  
end