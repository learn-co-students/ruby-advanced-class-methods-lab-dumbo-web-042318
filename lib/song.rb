require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.create
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      self.create_by_name(name)
    else
      song
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1].split(".").first
    artist_name = filename.split(" - ").first
    new_song = self.new_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end

end
