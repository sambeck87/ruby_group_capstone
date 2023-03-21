class Label
  attr_accessor :title, :color

  def initialize(title, color, id = SecureRandom.uuid)
    @title = title
    @color = color
    @items = []
    @id = id
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
