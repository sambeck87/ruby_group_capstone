require 'rspec'
require_relative '../classes/author'

describe Author do
  context 'When testing Author class' do
    author = Author.new('Sam', 'Rowling')
    author2 = Author.create_author('frank', 'theo')
    author_required = Author.by_id(author2.id)

    name = author.first_name
    last_name = author.last_name
    id = author.id
    name2 = author2.first_name
    id2 = author2.id
    author_name_required = author_required.first_name

    it 'The name of the author should be "Sam"' do
      expect(name).to eq('Sam')
    end

    it 'The last_name of the author should be "Rowling"' do
      expect(last_name).to eq('Rowling')
    end

    it 'The name2 should be capitalize' do
      expect(name2).to eq('Frank')
    end

    it 'The id numbers should be diferent each other' do
      expect(id).not_to eq(id2)
    end

    it 'It should return name the Author with the ID required' do
      expect(author_name_required).to eq('Frank')
    end
  end
end
