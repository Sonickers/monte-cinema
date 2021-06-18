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
end
