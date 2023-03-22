require 'rspec'
require_relative '../classes/item'

describe Item do
  context 'When testing Item class' do
    it 'Create an Item correctly' do
      genre = double('genre')
      allow(genre).to receive(:name).and_return('Rock')
      author = double('author')
      allow(author).to receive(:first_name).and_return('Michael')
      allow(author).to receive(:last_name).and_return('Jackson')
      label = double('label')
      allow(label).to receive(:title).and_return('Bad')
      allow(label).to receive(:color).and_return('White')
      publish_date = '1998-10-08'

      item = Item.new(genre, author, label, publish_date)
      genre_name = item.genre.name
      label_color = item.label.color
      author_name = item.author.first_name

      expect(genre_name).to eq('Rock')
      expect(label_color).to eq('White')
      expect(author_name).to eq('Michael')
      expect(item.move_to_archive).to be true

    end
  end
end
