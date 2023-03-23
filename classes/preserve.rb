require 'json'

def save_author(author)
  authors = author.map do |a|
    [
      a.first_name,
      a.last_name,
      a.id
    ]
  end
  authors_json = JSON.generate(authors)
  File.exist?('data/authors.json') ? File.open('data/authors.json', 'w') : File.new('data/authors.json', 'w')
  File.write('./data/authors.json', authors_json)
end

def save_game(game)
  games = game.map do |g|
    [
      g.genre.id,
      g.author.id,
      g.label.id,
      g.publish_date,
      g.last_played_at,
      g.multiplayer
    ]
  end
  games_json = JSON.generate(games)
  File.exist?('data/games.json') ? File.open('data/games.json', 'w') : File.new('data/games.json', 'w')
  File.write('./data/games.json', games_json)
end
