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
    genre_obj = self.all.find { |genre| genre.name == name }
    genre_obj = self.new(name) if genre_obj.nil?
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.by_id(id)
    self.all.find { |genre| genre.id == id }
  end

  def self.from_hash(genre)
    self.new(genre['name'], genre['id'])
  end

  def self.from_hash_array(array)
    array.each { |genre| self.from_hash(genre) }
  end
end
