class Reservation < ApplicationRecord
  TIME_STEP_IN_MINUTES = 30
  
  belongs_to :table
  belongs_to :client

  validate :reservation_time
  validate :restaurant_work_time
  validate :time_step
  
  private

  def reservation_time
    table.reservations.each do |res|
      if res.reserve_start < reserve_end && res.reserve_end > reserve_start
        errors[:base] << "this time period is already taken"
      end
    end
  end

  def restaurant_work_time
    if reserve_start < table.restaurant.work_from || reserve_end > table.restaurant.work_to
      errors[:base] << "restaurant #{table.restaurant.name} closed at this time period"
    end
  end

  def time_step
    if ((reserve_end - reserve_start) / 60) % TIME_STEP_IN_MINUTES != 0
      errors[:base] << "set correct reserve time, time step: #{TIME_STEP_IN_HOURS}"
    elsif reserve_end <= reserve_start
      errors[:base] << "start time can't be bigger or equals to end time"
    end
  end
end
