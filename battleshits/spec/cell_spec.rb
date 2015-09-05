require "cell"

describe Cell do

  let(:coordinate) { instance_double("Coordinate", latitude: :B, longitude: 4) }

  it 'has a coordinate' do
    cell = Cell.new(:coordinate)
    expect(cell.coordinate).to eq :coordinate
  end
end
