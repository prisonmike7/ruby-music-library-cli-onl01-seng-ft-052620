class Artist

  attr_accessor :name, :song, :musiclibrarycontroller, :musicimporter
  extend Concerns::Findable
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

  def songs
    @songs
  end

  def add_song(song)
    song.artist.nil? ? song.artist = self : nil
    @songs.include?(song) ? nil : @songs << song
    song
  end

  def genres
    @new_array = []
    @songs.each do |song|
      @new_array.include?(song.genre) ? nil : @new_array << song.genre
    end
    @new_array
  end

end
