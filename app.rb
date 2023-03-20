class App
  def list_books; end

  def list_albums; end

  def list_games; end

  def list_genres; end

  def list_labels; end

  def list_author; end

  def add_book; end

  def add_album; end

  def add_game; end

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
