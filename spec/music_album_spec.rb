require_relative '../classes/music_album'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/author'

describe MusicAlbum do
  context 'When testing the can_be_archived? method' do
    it 'should return true if parent\'s method returns true and if on_spotify equals true.' do
      genre = Genre.new('Rock')
      author = Author.new('Paul', 'McCartney')
      label = Label.new('Sony', 'Green')
      album = MusicAlbum.new(genre, author, label, '2008-05-08', on_spotify: true)

      expect(album.can_be_archived?).to eq true
    end
  end
end
