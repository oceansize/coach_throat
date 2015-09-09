require "cell"

class Water
  def ==(blah)
    true
  end
end
class Hit; end
class CriticalHit; end
class Ship; end

describe Cell do

  let(:coordinate) { instance_double("Coordinate", latitude: :B, longitude: 4) }
  let(:cell)       { Cell.new(coordinate) }
  let(:water)      { class_double("Water").as_stubbed_const(:new) }

  it "has a coordinate, which has a longitude and latitude" do
    expect(cell.coordinate.latitude).to eq :B
    expect(cell.coordinate.longitude).to eq 4
  end

  it "is the same cell if it is in the same coordinate" do
    expect(Cell.new(coordinate)).to eq cell
  end

  it "can have content passed to it" do
    water = double :water
    expect(Cell.new(coordinate, water).content).to eq water
  end

  it 'is filled with water by default' do
    expect(Water).to receive :new
    Cell.new(coordinate)
  end

  it "can be hit" do
    cell.receive_hit
    expect(cell.hit_status?).to be(true)
  end

  it "knows if a cell has already been hit" do
    cell.receive_hit
    expect(cell.receive_hit).to eq "You've already fired on this location"
  end

  it "registers a critical hit if cell contains a ship" do
    ship = Ship.new
    cell.receive_ship(ship)
    cell.receive_hit
  end

  it "can receive a ship" do
    ship = Ship.new
    cell.receive_ship(ship)
    expect(cell.content.class).to eq(Ship)
  end
end
