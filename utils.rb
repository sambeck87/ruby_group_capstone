require 'json'
require_relative './classes/author'
require_relative './classes/game'
require_relative './classes/preserve'
require_relative './classes/book'

OPTIONS = {
  1 => ['List all books', 'list_books'],
  2 => ['List all music albums', 'list_albums'],
  3 => ['List of games', 'list_games'],
  4 => ['List all genres', 'list_genres'],
  5 => ['List all labels', 'list_labels'],
  6 => ['List all authors', 'list_authors'],
  7 => ['Add a book', 'add_book'],
  8 => ['Add a music album', 'add_album'],
  9 => ['Add a game', 'add_game'],
  10 => %w[Exit exit]
}.freeze

def load_data
  recover_author
  load_genres
  load_labels
  recover_games
  load_albums
  recover_games
  load_books
end

def preserve_data
  save_author(Author.all)
  save_game(Game.all)
  save_genres
  save_albums
  save_books
  save_labels
end

def recover_author
  return unless File.exist?('data/authors.json') && File.size?('data/authors.json')

  File.write('./data/authors.json', '') unless File.exist?('./data/authors.json')
  author_data = File.read('./data/authors.json')

  if author_data.strip.empty?
    puts 'Not authors found'
  elsif Author.all.empty?
    author_data = JSON.parse(author_data)
    author_data.each do |author|
      Author.new(author[0], author[1], author[2])
    end
  end
end

def recover_games
  return unless File.exist?('data/games.json') && File.size?('data/games.json')

  File.write('./data/games.json', '') unless File.exist?('./data/games.json')
  games_data = File.read('./data/games.json')

  if games_data.strip.empty?
    puts 'Not games found'
  elsif Game.all.empty?
    games_data = JSON.parse(games_data)
    games_data.each do |game|
      genre = Genre.by_id(game[0])
      author = Author.by_id(game[1])
      label = Label.by_id(game[2])
      new_game = Game.new(genre, author, label, game[3], game[4])
      new_game.move_to_archive
      new_game.multiplayer = game[5]
    end
  end
end

def load_genres
  return unless File.exist?('data/genres.json') && File.size?('data/genres.json')

  Genre.from_hash_array(JSON.parse(File.read('data/genres.json')))
end

def load_albums
  return unless File.exist?('data/albums.json') && File.size?('data/albums.json')

  MusicAlbum.from_hash_array(JSON.parse(File.read('data/albums.json')))
end

def save_genres
  File.exist?('data/genres.json') ? File.open('data/genres.json', 'w') : File.new('data/genres.json', 'w')
  File.write('data/genres.json', Genre.all.to_json)
end

def save_albums
  File.exist?('data/albums.json') ? File.open('data/albums.json', 'w') : File.new('data/albums.json', 'w')
  File.write('data/albums.json', MusicAlbum.all.to_json)
end

def album_from_user_input
  print 'Input album author first name: '
  author_firstname = gets.chomp
  print 'Input album author last name: '
  author_lastname = gets.chomp
  author = Author.create_author(author_firstname, author_lastname) if author.nil?
  print 'Input album label: '
  label = gets.chomp
  print 'Input album genre: '
  genre_name = gets.chomp
  genre = Genre.create_genre(genre_name)
  print 'Input publish date: '
  publish_date = gets.chomp
  MusicAlbum.new(genre, author, label, publish_date)
  puts "Album created succesfully.\n\n"
end

def save_books
  File.exist?('data/books.json') ? File.open('data/books.json', 'w') : File.new('data/books.json', 'w')
  File.write('data/books.json', Book.all.to_json)
end

def save_labels
  File.exist?('data/labels.json') ? File.open('data/labels.json', 'w') : File.new('data/labels.json', 'w')
  File.write('data/labels.json', Label.all.to_json)
end

def load_books
  return unless File.exist?('data/books.json') && File.size?('data/books.json')

  data = JSON.parse(File.read('./data/books.json'))
  data.each do |book|
    Book.new(
      Genre.by_id(book['genre_id']),
      Author.by_id(book['author_id']),
      Label.by_id(book['label_id']),
      '2022-01-01',
      book['publisher']
    )
  end
end

def load_labels
  return unless File.exist?('data/labels.json') && File.size?('data/labels.json')

  data = JSON.parse(File.read('./data/labels.json'))
  data.each { |label| Label.new(label['title'], label['color'], label['id']) }
end
