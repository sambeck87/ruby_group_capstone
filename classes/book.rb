require_relative './item'

class Book < Item
  def initialize(genre, author, label, publish_date, publisher)
    super(genre, author, label, publish_date)
    @publisher = publisher
    @cover_state = ''
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
