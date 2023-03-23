require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(genre, author, label, publish_date, on_spotify: false)
    super(genre, author, label, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_json(*_option)
    {
      genre_id: @genre.id,
      author_id: @author.id,
      label_id: @label.id,
      publish_date: @publish_date,
      on_spotify: @on_spotify
    }.to_json
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.from_hash(album)
    genre_obj = Genre.by_id(album['genre_id'])
    author_obj = Author.by_id(album['author_id'])
    label_obj = Label.by_id(album['label_id'])
    new(genre_obj, author_obj, label_obj, album['publish_date'], on_spotify: album['on_spotify'])
  end

  def self.from_hash_array(array)
    array.each { |album| from_hash(album) }
  end
end
