require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
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
  
  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end
  
  
  def self.new_from_filename(filename)
    elements = filename.split(" - ")
    song_title = elements[1]
    song_artist = Artist.find_or_create_by_name(elements[0])
    song_genre = Genre.find_or_create_by_name(elements[2].gsub(".mp3", ""))
    
    Song.new(song_title, song_artist, song_genre)
    
  end
  
  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end


  
end