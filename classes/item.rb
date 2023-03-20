require 'securerandom'
require 'date'

class Item
  attr_accessor :genre, :source, :author, :label, :publish_date

  def initialize(genre, author, source, label, publish_date)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = Date.parse(publish_date)
    @id = SecureRandom.uuid
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today - @publish_date).to_f / 365 > 10
  end
end

date = Item.new(nil, nil, nil, nil, '2010-10-09')
p date.can_be_archived?
