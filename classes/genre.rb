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

  def self.create_genre(name)
    genre_obj = all.find { |genre| genre.name == name }
    enre_obj.nil? ? new(name) : genre_obj
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.by_id(id)
    all.find { |genre| genre.id == id }
  end

  def self.from_hash(genre)
    new(genre['name'], genre['id'])
  end

  def self.from_hash_array(array)
    array.each { |genre| from_hash(genre) }
  end
end
