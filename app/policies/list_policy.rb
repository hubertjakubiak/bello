class ListPolicy < ApplicationPolicy
  def create?
    is_owner? || is_member?
  end

  def new?
    is_owner? || is_member?
  end

  def edit?
    is_owner? || is_member?
  end

  def update? 
    is_owner? || is_member?
  end

  def destroy?
    is_owner? || is_member?
  end

  private

  def is_owner?
    user == record.board.owner
  end

  def is_member?
    record.board.members.includes(user)
  end
end