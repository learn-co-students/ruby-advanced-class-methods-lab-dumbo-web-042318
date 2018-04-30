class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    all << self
  end

  def self.create
    all << Song.new
    all[-1]
  end

  def self.new_by_name(title)
    create.name = title
    all[-1]
  end

  def self.create_by_name(title)
    new_by_name(title)
  end

  def self.find_by_name(title)
    all.find {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    find_by_name(title) ? find_by_name(title) : create_by_name(title)
  end

  def self.alphabetical
    all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    name_and_artist = file_name.split(" - ")
    song = create_by_name(name_and_artist[1].chomp(".mp3"))
    song.artist_name = name_and_artist[0]
    song
  end

  def self.create_from_filename(file_name)
    all << new_from_filename(file_name)
  end

  def self.destroy_all
    all.clear
  end

end
