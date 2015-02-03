class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present? 
  end
  
  def destroy?
    record.user == user || user.admin? 
  end
  
  def update?
    record.user == user || user.admin? 
  end
end