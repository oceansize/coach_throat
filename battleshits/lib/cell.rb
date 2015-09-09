class Cell < Struct.new(:coordinate, :content)

  def initialize(coordinate= :A1, content= Water.new)
    super
  end

  def ==(other)
    self.class == other.class && self.coordinate == other.coordinate && self.content.class == other.content.class
  end

  def each
    eac
  end

  def receive_hit
    return "You've already fired on this location" if self.content.is_a? Hit
    self.content = has_ship? ? CriticalHit.new : Hit.new
  end

  def has_ship?
    self.content.is_a? Ship
  end

  def receive_ship(ship)
    self.content = ship
  end

  def hit_status?
    self.content.is_a? Hit
  end
end
