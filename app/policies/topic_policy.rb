class TopicPolicy < ApplicationPolicy
 

  def index?
    true
  end
 
  def create?
    user.present?
  end
 
  def destroy?
    create?
  end
 
  def update?
    create?
  end

  def show?
    user.present?
  end
end

