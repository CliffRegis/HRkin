class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present? 
  end
  
  def destroy?
    user.present? && (record.user == user)
  end
  
  def update?
    user.present? && (record.user == user)
  end
end