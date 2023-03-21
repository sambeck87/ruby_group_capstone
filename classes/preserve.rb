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
