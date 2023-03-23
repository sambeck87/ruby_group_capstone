require 'rspec'
require_relative '../classes/label'
require_relative '../classes/book'

describe Label do
  context 'When testing Label class' do
    label = Label.new('My book', 'red')

    it 'The title of label should be "My book"' do
      expect(label.title).to eq('My book')
    end

    it 'The color of label should be "red"' do
      expect(label.color).to eq('red')
    end

    it 'The Label should has an Id' do
      expect(label.id.length).to be > 5
    end

    it 'The length of items should be 1 after add_item' do
      book = Book.new('Terror', 'Me', 'The book', '2000-01-01', 'He')
      label.add_item(book)
      expect(label.items.length).to eq 1
    end

    it 'Should return nil if ask for non existent object by id' do
      expect(Label.by_id('abc')).to eq(nil)
    end

    it 'Should return label object when ask for existent id' do
      expect(Label.by_id(label.id)).to eq(label)
    end
  end
end
