class Genre
  attr_accessor :name, :id

  def initialize(name, id = SecureRandom.uuid)
    @name = name
    @id = id
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_json(*_option)
    {
      id: @id,
      name: @name
    }.to_json
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
