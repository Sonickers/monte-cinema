class ReservationPolicy
  attr_reader :user, :reservation

  def initialize(user, reservation)
    @user = user
    @reservation = reservation
  end

  def index?
    true
  end

  def show?
    reservation.user_id == user.id || user.admin?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      return scope.all if user.employee? || user.admin?

      scope.where(user_id: user.id)
    end
  end
end
