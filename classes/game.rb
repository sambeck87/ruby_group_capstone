require 'date'
require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(genre, author, label, publish_date, last_played_at)
    super(genre, author, label, publish_date)
    @last_played_at = Date.parse(last_played_at)
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  private

  def can_be_archived?
    super && ((Date.today.year - @last_played_at.year) > 2)
  end
end
