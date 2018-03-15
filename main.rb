class Bicycle
  attr_reader :size, :tape_color,
    :front_shock, :rear_shock, :style

  def initialize(args)
    @size        = args[:size]
    @tape_color  = args[:tape_color]
    # マウンテンバイクに対応するために追加
    @style       = args[:style]
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
  end

  def spares
    if style == :road
      { chain: '10-speed',
        tire_size: '23', # milimeters
        tape_color: tape_color }
    else
      { chain: '10-speed',
        tire_size: '2.1', # inches,
      rear_shock: rear_shock }
    end
  end
end

bike = Bicycle.new(
  style: :mountain,
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox')

bike.spares
