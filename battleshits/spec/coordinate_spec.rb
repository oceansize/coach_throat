require 'coordinate'

describe Coordinate do
  let(:coordinate)   { Coordinate.new   }
  let(:b_coordinate) { Coordinate.new(:B, 4) }

  it 'has a latitude' do
    expect(b_coordinate.latitude).to eq :B
  end

  it 'has a default latitude if none is given' do
    expect(coordinate.latitude).to eq :A
  end

  it 'has a longitude' do
    expect(b_coordinate.longitude).to eq 4
  end

  it 'has a default longitude' do
    expect(coordinate.longitude).to eq 1
  end

  it 'creates a coordinate from a string' do
    coordinate = Coordinate.parse('b4')
    expect(coordinate).to eq b_coordinate
  end
end
