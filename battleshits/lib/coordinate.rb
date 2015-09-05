class Coordinate < Struct.new(:latitude, :longitude)

  def initialize(latitude=:A, longitude=1)
    super
  end

  def self.parse(coordinate_string)
    string_array = coordinate_string.chars
    latitude = string_array.first.to_sym
    longitude = string_array.last.to_i
    new(latitude, longitude)
  end

  def ==(other)
    self.class == other.class && self.latitude == other.latitude && self.longitude == other.longitude
  end
end
