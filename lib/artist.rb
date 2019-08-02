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
  
  # def self.find_or_create_by_name(artist_name)
  #   existing_artist = self.all.detect {|a| a.name == artist_name}
  #   if existing_artist
  #     existing_artist
  #   else
  #     new_artist = Artist.new(artist_name)
  #     new_artist.save
  #     new_artist
  #   end
  # end
  
end