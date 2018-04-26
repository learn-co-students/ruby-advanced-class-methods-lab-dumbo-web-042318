require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize

  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song

  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    #@@all << song
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    @@all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
     self.find_by_name(song_name) == nil ?
      self.create_by_name(song_name) : self.find_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song = filename.split(" - ")
    #binding.pry
    song_title = song[1].split(".")[0]
    new_song = self.create_by_name(song_title)
    new_song.artist_name = song[0]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    @@all << new_song
  end

  def self.destroy_all
    @@all.clear
  end

end

#Pry.start
