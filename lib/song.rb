class Song
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) unless artist == nil
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end
  
end