require "docking_station"

describe DockingStation do

  let(:bike) { instance_double("Bike", working?: true) }

  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock).with(1).argument }

  it "has a default capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "can redefine the capacity" do
    new_capacity = 300
    subject.set_capacity(new_capacity)

    expect(subject.capacity).to eq new_capacity
  end

  context "when releasing bikes" do

    it "releases working bikes" do
      subject.dock(bike)

      expect(subject.release_bike).to be_working
    end

    it "raises an error if there are no bikes" do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end

  context "when docking bikes " do

    it "won't allow more bikes than its capacity" do
      subject.capacity.times { subject.dock(bike) }

      expect { subject.dock(bike) }.to raise_error "Docking Station is full."
    end
  end
end

