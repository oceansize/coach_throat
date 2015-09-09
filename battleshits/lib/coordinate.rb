class Coordinate < Struct.new(:latitude, :longitude)

  def initialize(latitude=:A, longitude=1)
    super
  end

  def self.parse(coordinate_string)
    if !(coordinate_string.upcase =~ /\A(\w)(\d+)\z/)
      raise 'invalid coordinate'
    end
    latitude = $1.to_sym
    longitude = $2.to_i
    new(latitude, longitude)
  end

  def ==(other)
    self.class == other.class && self.latitude == other.latitude && self.longitude == other.longitude
  end
end
