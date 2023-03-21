require 'json'
require_relative './classes/author'

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

def recover_author
  File.write('./data/authors.json', '') unless File.exist?('./data/authors.json')
  author_data = File.read('./data/authors.json')

  if author_data.strip.empty?
    puts 'Not authors found'
  elsif Author.all.empty?
    author_data = JSON.parse(author_data)
    author_data.each do |author|
      p author
      Author.new(author[0], author[1], author[2])
    end
  end
end

recover_author
p Author.all
=begin
def recover_games
  File.write('./data/games.json', '') unless File.exist?('./data/games.json')
  games_data = File.read('./data/games.json')

  if games_data.strip.empty?
    puts 'Not games found'
  elsif Game.all.empty?
    games_data = JSON.parse(games_data)
    games_data.each do |game|
      Game.new(author[0], author[1])
    end
  end
end
=end
