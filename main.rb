class Bicycle
  attr_reader :size, :tape_color

  def initialize(args)
    @size = args[:size]
    @tape_color = args[:tape_color]
  end

  # すべての自転車は、デフォルト値として
  # 同じタイヤサイズとチェーンサイズを持つ
  def spares
    { chain: '10-speed',
      tire_size: '23',
      tape_color: tape_color
    }
  end

  # 他にもメソッドがたくさん
end

bike = Bicycle.new(
size: 'M',
tape_color: 'red'
)

bike.size # -> 'M'
bike.spares
# -> {:tire_size => '23',
#     :chain => '10-speed',
#     :tape_color => 'red'}



