require 'json'
require_relative './classes/author'
require_relative './classes/game'
require_relative './classes/preserve'

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
  recover_games
  load_genres
  load_albums
end

def preserve_data
  save_author(Author.all)
  save_game(Game.all)
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

def recover_objects_by_id(id)
  Author.all.find { |aut| aut.id == id }
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
      # genre = recover_objects_by_id(game[0])
      author = recover_objects_by_id(game[0]) # cambiar al index correcto al implementar todo
      # label = recover_objects_by_id(game[2])
      new_game = Game.new(nil, author, nil, game[1], game[2]) # cambiar al index correcto al implementar todo
      new_game.move_to_archive
      new_game.multiplayer = game[3]
    end
  end
end

def load_genres
  return unless File.exist?('data/genres.json') && File.size?('data/genres.json')
  JSON.parse(File.read('data/genres.json')).each { |genre| Genre.new(genre['name'], genre['id']) }
end

def load_albums
  return unless File.exist?('data/albums.json') && File.size?('data/albums.json')

  JSON.parse(File.read('data/albums.json')).each do |album|
    genre_obj = Genre.all.find { |genre| genre.id == album['genre_id'] }
    author_obj = Author.all.find { |author| author.id == album['author_id'] }
    MusicAlbum.new(genre_obj, author_obj, album['label'], album['publish_date'], on_spotify: album['on_spotify'])
  end
end
