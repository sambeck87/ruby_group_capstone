require 'rspec'
require_relative '../app'

describe Game do
  context 'When testing Game class' do
    it 'Create an Item correctly' do
      genre0 = double('genre0')
      allow(genre0).to receive(:name).and_return('Thriller')
      author0 = double('author0')
      allow(author0).to receive(:first_name).and_return('Sergey')
      allow(author0).to receive(:last_name).and_return('Ivanov')
      label0 = double('label0')
      allow(label0).to receive(:title).and_return('S.T.A.L.K.E.R.: Shadow of Chernobyl')
      allow(label0).to receive(:color).and_return('Black')
      publish_date = '2007-03-20'
      multiplayer = false
      last_played_at = '2020-01-19'

      app = App.new
      app.created_game([multiplayer, last_played_at,  publish_date, author0])
      publish_date_object = Game.all[0].publish_date.strftime
      #genre_name = Game.all[0].genre.name
      #label_title = Game.all[0].label.title
      #author_name = Game.all[0].author.first_name

      expect(publish_date_object).to eq('2007-03-20')
      #expect(label_title).to eq('S.T.A.L.K.E.R.: Shadow of Chernobyl')
      #expect(author_name).to eq('Sergey')
      #expect(game.move_to_archive).to be true
    end

    it 'Create an Item correctly' do
      genre1 = double('genre1')
      author1 = double('author1')
      allow(author1).to receive(:first_name).and_return('Sergey')
      allow(author1).to receive(:last_name).and_return('Ivanov')
      label1 = double('label1')
      publish_date = '2007-03-20'
      multiplayer = false
      last_played_at = '2020-01-19'

      app = App.new
      app.created_game([true, last_played_at,  publish_date, author1])
      author_name = Game.all[1].author.first_name

      expect(author_name).to eq('Sergey')
    end

    it 'Archive should be true' do
      genre2 = double('genre2')
      author2 = double('author2')
      label2 = double('label2')
      publish_date = '2007-03-20'
      last_played_at = '2020-01-19'

      app = App.new
      app.created_game([false, last_played_at,  publish_date, author2])
      archive = Game.all[2].move_to_archive

      expect(archive).to be true
    end
  end
end
