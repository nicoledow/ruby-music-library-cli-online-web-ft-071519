require 'pry'

class MusicLibraryController
  attr_reader :path
  
  def initialize(path='./db/mp3s')
    @path = path
    new_importer = MusicImporter.new(path)
    new_importer.import
  end
  
  def call
    #user_input = ""
    
    while user_input != "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    end
    
    user_input = gets.strip.downcase
   
    case user_input
    when "list songs"
      list_songs
    when "list artists"
      list_artists
    when "list genres"
      list_genres
    when "list artist"
      list_songs_by_artist
    when "play song"
      play_song
    end
  
  end
  
  def list_songs
    alphabetized_by_title = Song.all.sort_by {|song| song.name}
    
    alphabetized_by_title.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    artists = Artist.all.sort_by {|artist| artist.name}
    
    artists.each_with_index do |artist, i|
      puts "#{i + 1}. #{artist.name}"
    end
  end
  
  def list_genres
    genres = Genre.all.sort_by {|genre| genre.name}
    
    genres.each_with_index do |genre, i|
      puts "#{i + 1}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    
    songs_by_artist = Song.all.select {|s| s.artist.name.downcase == input.downcase}
    songs_by_artist.sort_by! {|song| song.name}
    songs_by_artist.each_with_index do |song, i|
      puts "#{i + 1}. #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    
    songs_in_genre = Song.all.select {|s| s.genre.name.downcase == input.downcase}
    songs_in_genre.sort_by! {|song| song.name}
    songs_in_genre.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name}"
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    alphabetized_by_title = Song.all.sort_by {|song| song.name}
    
    if input.between?(1, (Song.all.length - 1))
      puts "Playing #{alphabetized_by_title[input - 1].name} by #{alphabetized_by_title[input - 1].artist.name}"
    end
  end
  
  
end