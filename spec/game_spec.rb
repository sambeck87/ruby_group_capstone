require 'rspec'
require_relative '../classes/game'

describe Game do
  context 'When testing Game class author' do
    it 'The name of the author should be Sergey' do
      genre1 = double('genre1')
      author1 = double('author1')
      allow(author1).to receive(:first_name).and_return('Sergey')
      allow(author1).to receive(:last_name).and_return('Ivanov')
      label1 = double('label1')
      publish_date = '2007-03-20'
      last_played_at = '2020-01-19'

      game1 = Game.new(genre1, author1, label1, publish_date, last_played_at)
      author_name = game1.author.first_name

      expect(author_name).to eq('Sergey')
    end
  end

  context 'When testing Game class move_to archive' do
    it 'Archive should be true' do
      genre2 = double('genre2')
      author2 = double('author2')
      label2 = double('label2')
      publish_date = '2007-03-20'
      last_played_at = '2020-01-19'

      game2 = Game.new(genre2, author2, label2, publish_date, last_played_at)
      archive = game2.move_to_archive

      expect(archive).to be true
    end
  end

  context 'When testing Game class label' do
    it 'The name of the game should be "Shadow of Chernobyl"' do
      genre3 = double('genre3')
      author3 = double('author3')
      label3 = double('label3')
      allow(label3).to receive(:title).and_return('Shadow of Chernobyl')
      allow(label3).to receive(:color).and_return('Black')
      publish_date = '2017-03-20'
      last_played_at = '2021-01-19'

      game3 = Game.new(genre3, author3, label3, publish_date, last_played_at)
      name_game = game3.label.title

      expect(name_game).to eq('Shadow of Chernobyl')
    end
  end
end
