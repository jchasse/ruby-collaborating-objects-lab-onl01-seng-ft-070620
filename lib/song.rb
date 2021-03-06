require'pry'
 
class Song
 
    @@all = []
    attr_accessor :name, :artist
 
    def initialize (name)
        @name = name
        @@all << self
    end
 
    def self.all
        @@all
    end
 
    def self.new_by_filename(filename)
        parse_song = filename.split(" - ")[1]
        song = Song.new(parse_song)
        song.artist = Artist.find_or_create_by_name (filename.split(" - ")[0])
        song
    end

    def artist_name= (name)
        self.artist = Artist.find_or_create_by_name(name)
    end
 
end
