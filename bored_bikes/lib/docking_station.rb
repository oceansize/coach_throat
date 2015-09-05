require 'forwardable'

class DockingStation
  extend Forwardable

  attr_reader    :bikes
  attr_accessor  :capacity

  def_delegator :bikes, :empty?

  DEFAULT_CAPACITY = 20.freeze

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def set_capacity(new_capacity)
    self.capacity = new_capacity
  end

  def release_bike
    fail "No bikes available" if empty?
    bikes.pop
  end

  def dock(bike)
    fail "Docking Station is full." if full?
    bikes << bike
  end

  private

  def full?
    bikes.count >= capacity
  end
end

