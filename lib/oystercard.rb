class Oystercard
  attr_reader :balance, :exit_station, :journey
  MAX_VALUE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = MINIMUM_BALANCE

  def initialize
    @balance = 0
    @journey = {}
  end

  def top_up(amount)
    raise "Max balance £#{MAX_VALUE}" if @balance + amount > MAX_VALUE
    @balance += amount
  end

  def touch_in(station)
    raise "You don't have enough money on your card" if @balance < MINIMUM_BALANCE
    @journey = {:entry_station => station}
    true
  end

  def touch_out(station)
    @balance -= 1
    @exit_station = station
    @journey.store(:exit_station, station)
    true
  end

  def in_journey?
    !exit_station
  end

  private

  def deduct(fare)
    @balance -= fare
  end
end
