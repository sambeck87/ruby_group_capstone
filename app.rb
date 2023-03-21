require 'json'
require_relative './classes/author'
require_relative './classes/game'
require_relative './classes/preserve'

class App
  # def initialize
  @games = []
  @authors = []
  # end

  def list_books; end

  def list_albums; end

  def list_games; end

  def list_genres; end

  def list_labels; end

  def self.list_author
    File.write('./data/authors.json', '') unless File.exist?('./data/authors.json')
    author_data = File.read('./data/authors.json')

    if author_data.strip.empty?
      @authors = []
      puts 'Not authors found'
    elsif @authors.empty?
      author_data = JSON.parse(author_data)
      author_data.each do |author|
        @authors.push(Author.new(author[0], author[1]))
      end
      @authors.each { |author| puts "Name: #{author.first_name}, Lastname: #{author.last_name}" }
    end
  end

  def add_book; end

  def add_album; end

  def self.add_game
    print 'Is the game multiplayer? (Y/N): '
    multiplayer = gets.chomp.to_s.downcase == 'y'
    print 'Last played at (YYYY-MM-DD): '
    last_played = gets.chomp.to_s
    print 'Publish date (YYYY-MM-DD): '
    publish_date = gets.chomp.to_s
    print 'Genre: '
    # genre = Genre.new(gets.chomp.to_s)
    print 'Label: '
    # label = Label.new(gets.chomp.to_s)
    print 'Author First Name: '
    first_name = gets.chomp.to_s
    print 'Author Last Name: '
    last_name = gets.chomp.to_s
    author = Author.new(first_name, last_name)
    new_game = Game.new(genre = nil, author, label = nil, publish_date, multiplayer, last_played)
    new_game.move_to_archive
    @games << new_game
    @authors << author
    # @genres << genre
    # @labels << label
    save_author(@authors)
    puts 'The Game has been created successfully ✅'
  end

  def exit; end

  def run
    loop do
      puts 'Please select an option:'
      OPTIONS.each { |key, value| puts "#{key} - #{value[0]}" }
      option = get_option_selected(1, 10)
      send((OPTIONS[option][1]).to_s)

      break if option == 10
    end
  end
end

App.list_author
App.add_game
