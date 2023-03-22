require 'rspec'
require_relative '../classes/item'

describe Item do
  context 'When testing Item class genre' do
    it 'Genre name should be Rock' do
      genre0 = double('genre0')
      allow(genre0).to receive(:name).and_return('Rock')
      author0 = double('author0')
      label0 = double('label0')
      publish_date = '1998-10-08'

      item0 = Item.new(genre0, author0, label0, publish_date)
      genre0_name = item0.genre.name

      expect(genre0_name).to eq('Rock')
    end
  end

  context 'When testing Item class label' do
    it 'Label color should be White' do
      genre1 = double('genre1')
      author1 = double('author1')
      label1 = double('label1')
      allow(label1).to receive(:title).and_return('Bad')
      allow(label1).to receive(:color).and_return('White')
      publish_date = '1998-10-08'

      item1 = Item.new(genre1, author1, label1, publish_date)
      label_color = item1.label.color

      expect(label_color).to eq('White')
    end
  end

  context 'When testing Item class author' do
    it 'Authors name should be Michael' do
      genre2 = double('genre2')
      author2 = double('author2')
      allow(author2).to receive(:first_name).and_return('Michael')
      allow(author2).to receive(:last_name).and_return('Jackson')
      label2 = double('label2')
      publish_date = '1998-10-08'

      item2 = Item.new(genre2, author2, label2, publish_date)
      author_name = item2.author.first_name

      expect(author_name).to eq('Michael')
    end
  end

  context 'When testing Item class move_to_archive' do
    it 'The result should be true' do
      genre3 = double('genre3')
      author3 = double('author3')
      label3 = double('label3')
      publish_date = '1998-10-08'

      item = Item.new(genre3, author3, label3, publish_date)

      expect(item.move_to_archive).to be true
    end
  end
end
