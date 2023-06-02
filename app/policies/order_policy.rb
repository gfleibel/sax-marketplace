class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    record.first.user == user
  end

  def sales?
    record.first.user == user
  end

  def create?
    true
  end
end
