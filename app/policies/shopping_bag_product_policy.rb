class ShoppingBagProductPolicy < ApplicationPolicy

  def create?
    true
  end

  def update?
    record.shopping_bag.user == user
  end

  def destroy?
    record.shopping_bag.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
