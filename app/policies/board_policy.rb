class BoardPolicy < ApplicationPolicy
  def edit?
    is_owner? || is_member?
  end

  def update?
    is_owner? || is_member?
  end

  def destroy?
    is_owner?
  end

  private

  def is_owner?
    user == record.owner
  end

  def is_member?
    record.members.includes(user)
  end
end