require 'json'
require_relative './classes/author'
require_relative './classes/game'
require_relative './classes/preserve'
require_relative 'classes/genre'
require_relative 'classes/music_album'
require_relative './utils'

class App
  def initialize
    @music_albums = []
    @genres = []
    seed_data
  end

  def list_books; end

  def list_albums
    list = ''
    @music_albums.each_with_index do |album, i|
      list << "\nIndex: #{i} Genre: #{album.genre}, Author: #{album.author}, "
      list << "Label: #{album.label} Publish Date: #{album.publish_date}"
    end
    list << "\n\n"
    puts @music_albums.length.positive? ? list : 'There isn\'t any album.'
  end

  def list_games
    Game.all.each do |game|
      puts "
    Genre: #{game.genre}
    Author: #{game.author.first_name} #{game.author.last_name}
    Label title: #{game.label}
    Publish_date: #{game.publish_date}
    Last_played: #{game.last_played_at}
    Multiplayer: #{game.multiplayer}"
    end
  end

  def list_genres
    list = ''
    @genres.each_with_index { |genre, i| list << "\nIndex: #{i} Name: #{genre.name}" }
    list << "\n\n"
    puts @genres.length.positive? ? list : 'There isn\'t any genres.'
  end

  def list_labels; end

  def list_authors
    Author.all.each { |author| puts "Name: #{author.first_name}, Lastname: #{author.last_name}" }
  end

  def add_book; end

  def add_album
    genre = selected_genre
    print 'Input album author: '
    author = gets.chomp
    print 'Input album label: '
    label = gets.chomp
    print 'Input publish date: '
    publish_date = gets.chomp

    album = MusicAlbum.new(genre, author, label, publish_date)
    @music_albums.push(album) unless album.nil?
    puts "\nAlbum created successfully.\n\n"
  end

  def created_game(data)
    new_game = Game.new(nil, data[3], nil, data[2], data[1])
    new_game.move_to_archive
    new_game.multiplayer = data[0]
    save_author(Author.all)
    save_game(Game.all)
    puts 'The Game has been created successfully ✅'
  end

  def create_author(first_name, last_name, user_data_game)
    if Author.all.empty?
      user_data_game << Author.new(first_name, last_name)
    else
      #author = Author.all.find { |aut| aut.first_name == first_name && aut.last_name == last_name }
      Author.all.each do |author|
        found = author.first_name == first_name && author.last_name == last_name
        user_data_game << (found ? author : Author.new(first_name, last_name))
      end
    end
  end

  def add_game
    user_data_game = []
    print 'Is the game multiplayer? (Y/N): '
    user_data_game << (gets.chomp.to_s.downcase == 'y')
    print 'Last played at (YYYY-MM-DD): '
    user_data_game << gets.chomp.to_s
    print 'Publish date (YYYY-MM-DD): '
    user_data_game << gets.chomp.to_s
    print 'Genre: '
    # genre = Genre.new(gets.chomp.to_s)
    print 'Label: '
    # label = Label.new(gets.chomp.to_s)
    print 'Author First Name: '
    first_name = gets.chomp.to_s
    print 'Author Last Name: '
    last_name = gets.chomp.to_s
    create_author(first_name, last_name, user_data_game)
    created_game(user_data_game)
  end

  def exit; end

  def seed_data
    @genres.push(Genre.new('Thriller'))
    @genres.push(Genre.new('Comedy'))
    @genres.push(Genre.new('Rock'))
  end

  def selected_genre
    puts "\nSelect a genre from the following list by index:"
    puts list_genres

    option = get_option_selected(0, @genres.length - 1)
    @genres[option]
  end

  def run
    recover_author
    recover_games
    loop do
      puts 'Please select an option:'
      OPTIONS.each { |key, value| puts "#{key} - #{value[0]}" }
      option = get_option_selected(1, 10)
      send((OPTIONS[option][1]).to_s)

      break if option == 10
    end
  end
end
