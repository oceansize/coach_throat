require 'grid'

xdescribe Grid do

  let(:grid) { Grid.new }

  it "by default is 10 x 10 cells in size" do
    expect(grid.layout.length).to eq(100)
  end

  it "can be initialised to any size (squared)" do
    large_grid = Grid.new(200)
    expect(large_grid.layout.length).to eq(40000)
  end

  xit "each grid index contains a cell, which has coordinates" do

  end
end
