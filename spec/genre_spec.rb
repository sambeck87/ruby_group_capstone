require_relative '../classes/music_album'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/author'

describe Genre do
  context 'When testing the add_item method' do
    it 'should add the input item to the collection of items.' do
      genre2 = Genre.new('Rock')
      genre = Genre.new('Rock')
      author = Author.new('Paul', 'McCartney')
      label = Label.new('Sony', 'Green')
      album = MusicAlbum.new(genre2, author, label, '2008-05-08', on_spotify: true)
      genre.add_item(album)
      expect(genre.items.length).to eq 1
    end

    it 'should add self as a property of the item object.' do
      genre2 = Genre.new('Rock')
      genre = Genre.new('Rock')
      author = Author.new('Paul', 'McCartney')
      label = Label.new('Sony', 'Green')
      album = MusicAlbum.new(genre2, author, label, '2008-05-08', on_spotify: true)
      genre.add_item(album)
      expect(album.genre).to eq genre
    end
  end
end
