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
  File.write('./data/authors.json', authors_json)
end

def save_game(game)
  games = game.map do |g|
    [
      # g.genre.id,
      g.author.id,
      # g.label.id,
      g.publish_date,
      g.last_played_at,
      g.multiplayer
    ]
  end
  games_json = JSON.generate(games)
  p games_json
  File.write('./data/games.json', games_json)
end
