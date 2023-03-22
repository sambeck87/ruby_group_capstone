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

  def self.create_author(first_name, last_name)
    first_name = first_name.capitalize
    last_name = last_name.capitalize
    author = Author.all.find { |aut| aut.first_name == first_name && aut.last_name == last_name }
    author.nil? ? Author.new(first_name.capitalize, last_name.capitalize) : author
  end

  def self.by_id(id)
    Author.all.find { |aut| aut.id == id }
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.author = self
  end
end
