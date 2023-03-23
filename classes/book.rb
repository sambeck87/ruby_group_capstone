require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(genre, author, label, publish_date, publisher)
    super(genre, author, label, publish_date)
    @publisher = publisher
    @cover_state = 'bad'
  end

  def to_json(*_option)
    {
      id: @id,
      genre_id: @genre.id,
      author_id: @author.id,
      label_id: @label.id,
      publish_date: @publish_date,
      publisher: @publisher,
      cover_state: @cover_state
    }.to_json
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
