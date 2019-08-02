class Genre
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end
  
  def add_song(song)
    self.songs << song unless songs.include?(song)
  end
  
  def artists
    artists = self.songs.collect {|song| song.artist}
    artists.uniq
  end
  
end