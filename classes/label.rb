class Label
  attr_accessor :title, :color, :id, :items

  def initialize(title, color, id = SecureRandom.uuid)
    @title = title
    @color = color
    @items = []
    @id = id
  end

  def to_json(*_option)
    {
      title: @title,
      color: @color,
      items: @items,
      id: @id
    }.to_json
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.create_label(title, color)
    title = title.capitalize
    color = color.downcase
    label = all.find { |lab| lab.title == title }
    label.nil? ? new(title, color) : label
  end

  def self.by_id(id)
    all.find { |label| label.id == id }
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
