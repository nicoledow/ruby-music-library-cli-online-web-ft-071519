class Artist
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
  
  def self.create(artist)
    new_artist = self.new(artist)
    new_artist.save
    new_artist
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless songs.include?(song)
  end
  
  def genres
    all_genres = self.songs.collect {|song| song.genre}
    all_genres.uniq
  end
 
end