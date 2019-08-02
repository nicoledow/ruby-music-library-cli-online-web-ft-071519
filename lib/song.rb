class Song
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name, artist=nil)
    @name = name
    self.artist=(artist)
  end
  
  def artist=(artist)
    #how do I get to this artist within the Artist class and perform this method on it?
    #create an artist find or create method to use before
    add_song(self)
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