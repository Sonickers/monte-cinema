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
    user_owns_reservation?
  end

  def create_online?
    true
  end

  def create_offline?
    super_user?
  end

  def update?
    super_user?
  end

  def destroy?
    user_owns_reservation?
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

  private

  def user_owns_reservation?
    reservation.user_id == user.id || super_user?
  end

  def super_user?
    user.employee? || user.admin?
  end
end
