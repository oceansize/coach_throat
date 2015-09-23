module Helpers

  def build_fleet
    [ Ship.aircraft_carrier,
      Ship.battleship,
      Ship.destroyer,
      Ship.submarine,
      Ship.patrol_boat ]
  end
end
