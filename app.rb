require 'json'
require_relative './classes/author'
require_relative './classes/game'
require_relative 'classes/genre'
require_relative 'classes/music_album'
require_relative './classes/book'
require_relative './classes/label'
require_relative './utils'

class App
  def list_books
    puts "There isn't any book \n\n" if Book.all.empty?
    Book.all.each_with_index { |book, i| puts "#{i}) #{book.label.title}" }
  end

  def list_albums
    list = ''
    MusicAlbum.all.each_with_index do |album, i|
      list << "\nIndex: #{i} Genre: #{album.genre.name}, Author: #{album.author.first_name} #{album.author.last_name}, "
      list << "Label: #{album.label.title} #{album.label.color} Publish Date: #{album.publish_date}"
    end
    list << "\n\n"
    puts MusicAlbum.all.length.positive? ? list : "There isn't any album.\n\n"
  end

  def list_games
    puts "\n********************************** GAMES **********************************\n"
    Game.all.each_with_index do |game, index|
      puts "
    #{index} - Genre: #{game.genre.name}
        Author: #{game.author.first_name} #{game.author.last_name}
        Label title: #{game.label.title}
        Label color: #{game.label.color}
        Publish_date: #{game.publish_date}
        Last_played: #{game.last_played_at}
        Multiplayer: #{game.multiplayer} "
      puts "\n"
    end
  end

  def list_genres
    list = ''
    Genre.all.each_with_index { |genre, i| list << "\nIndex: #{i} Name: #{genre.name}" }
    list << "\n\n"
    puts Genre.all.length.positive? ? list : "There isn't any genres.\n\n"
  end

  def list_labels
    puts "There isn't any label \n\n" if Label.all.empty?
    Label.all.each_with_index { |label, i| puts "#{i}) #{label.title}" }
  end

  def list_authors
    puts "\n********************************** AUTHORS **********************************\n"
    Author.all.each_with_index { |author, index| puts "#{index} - Name: #{author.first_name} #{author.last_name}" }
    puts "\n\n"
  end

  def add_book
    print 'enter genre: '
    genre = gets.chomp
    print 'enter author first name: '
    author_first_name = gets.chomp
    print 'enter author last name: '
    author_last_name = gets.chomp
    print 'enter title: '
    title = gets.chomp
    print 'enter label color: '
    color = gets.chomp
    print 'enter publish date: '
    publish_date = gets.chomp
    print 'enter publisher: '
    publisher = gets.chomp

    genre_object = Genre.create_genre(genre)
    label_object = Label.create_label(title, color)
    author_object = Author.create_author(author_first_name, author_last_name)

    Book.new(genre_object, author_object, label_object, publish_date, publisher)
  end

  def add_album
    album_from_user_input
  end

  def created_game(data)
    new_game = Game.new(data[3], data[5], data[4], data[2], data[1])
    new_game.move_to_archive
    new_game.multiplayer = data[0]
    puts 'The Game has been created successfully ✅'
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
    user_data_game << Genre.create_genre(gets.chomp.to_s)
    print 'enter title: '
    title = gets.chomp
    print 'enter label color: '
    color = gets.chomp
    user_data_game << Label.create_label(title, color)
    print 'Author First Name: '
    first_name = gets.chomp.to_s
    print 'Author Last Name: '
    last_name = gets.chomp.to_s
    user_data_game << Author.create_author(first_name, last_name)
    created_game(user_data_game)
  end

  def exit; end

  def run
    load_data
    loop do
      puts 'Please select an option:'
      OPTIONS.each { |key, value| puts "#{key} - #{value[0]}" }
      option = get_option_selected(1, 10)
      send((OPTIONS[option][1]).to_s)

      break if option == 10
    end
    preserve_data
  end
end
