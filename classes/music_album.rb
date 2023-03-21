class MusicAlbum < Item
  attr_accessor :genre, :author, :label, :publish_date, :on_spotify

  def initialize(genre, author, label, publish_date, on_spotify: false)
    super(genre, author, label, publish_date)
    @on_spotify = on_spotify
  end
end
