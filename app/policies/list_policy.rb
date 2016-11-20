class ListPolicy < ApplicationPolicy
  def create?
    is_owner?
  end

  def new?
    is_owner?
  end

  def edit?
    is_owner?
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  private

  def is_owner?
    user == record.board.owner
  end
end