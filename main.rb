class Bicycle
  attr_reader :size, :chain, :tire_size
  # コードはすべてRoadBikeにうつされた
  #
  def initialize(args={})
    @size      = args[:size]
    @chain     = args[:chain]     || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def spares
    { tire_size: tire_size,
      chain: chain }
  end

  def default_chain # 共通の初期値
    '10-speed'
  end

  # サブクラスにこのメソッドがなかった場合、このメソッドが実行され、
  # 例外が投げられる
  def default_tire_size
    raise NotImplementedError,
      "This #{self.class} cannot respond to:"
  end

end

class RoadBike < Bicycle
  # かつてのBicycleクラスからのコードを全て含む
  attr_reader :tape_color,

  def initialize(args)
    @tape_color  = args[:tape_color]
    super(args) # RoadBikeはsuperを必ずよばなくてはならなくなった
  end

  def spares
    super.merge({tape_color: tape_color})
  end

  def default_tire_size
    '23' # サブクラスの初期値
  end

end

class MoutainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge({rear_shock: rear_shock})
  end

  def default_tire_size
    '2.1' # サブクラスの初期値
  end

end


road_bike = RoadBike.new(
  size: 'M',
  tape_color: 'red'
)
road_bike.size

mountain_bike = MoutainBike.new(
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox')

mountain_bike.size
# NoMethodError: undefined method 'size' <- そりゃそうだよ
#
mountain_bike.spares
# NoMethodError: super: no superclass method 'spares'
