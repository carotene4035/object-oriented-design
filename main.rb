class Bicycle
  attr_reader :size # RoadBikeから昇格
  # コードはすべてRoadBikeにうつされた
  #
  def initialize(args)
    @size        = args[:size]
  end
end

class RoadBike < Bicycle
  # かつてのBicycleクラスからのコードを全て含む
  attr_reader :tape_color,

  def initialize(args)
    @tape_color  = args[:tape_color]
    super(args) # RoadBikeはsuperを必ずよばなくてはならなくなった
  end

#  def spares
#    if style == :road
#      { chain: '10-speed',
#        tire_size: '23', # milimeters
#        tape_color: tape_color }
#    else
#      { chain: '10-speed',
#        tire_size: '2.1', # inches,
#      rear_shock: rear_shock }
#    end
#  end
end

class MoutainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end

end


road_bike = RoadBike.new(
  size: 'M',
  tape_color: 'red',
)
road_bike.size

mountain_bike = MoutainBike.new(
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox')

mountain_bike.size
# NoMethodError: undefined method 'size' <- そりゃそうだよ
# mountain_bike.spares
