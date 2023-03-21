class Label
  attr_accessor :title, :color

  def initialize(title, color, id = SecureRandom.uuid)
    @title = title
    @color = color
    @items = []
    @id = id
  end
end
