class Genre
  attr_accessor :name

  def initialize(name, id = SecureRandom.uuid)
    @name = name
    @id = id
    @items = []
  end
end
