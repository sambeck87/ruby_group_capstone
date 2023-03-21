require 'securerandom'
require_relative './item'

class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(first_name, last_name, id = SecureRandom.uuid)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.author = self
  end
end
