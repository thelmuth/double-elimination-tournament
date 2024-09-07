require 'csv'

class Song
    ## These initialized
    attr_accessor :title, :artist, :album, :group_seed, :tourney_seed

    ## These set later
    attr_accessor :tourney_place, :games

    def initialize(title, artist, album, group_seed, tourney_seed)
        @title = title
        @artist = artist
        @album = album
        @group_seed = group_seed
        @tourney_seed = tourney_seed
        @games = []
    end

    def to_s
        "#{@tourney_seed}. #{@title} - #{@artist} - #{@album} [#{@group_seed}]"
    end

end

### Example uses
# ocean = Song.new("Ocean", "Kenta Nagata", "The Wind Waker", 7, 641)
# wild_west = Song.new("Wild West Quadrant", "Gavin Parker", "Looney Tunes", 0, 56)
# puts ocean.artist
# puts wild_west.title, wild_west.tourney_seed


### Read example file
file = "short_example.csv"
songs_table = CSV.read(file)
songs = []

# p songs_table[0]
# p songs_table[3]

songs_table.each do |song_array|
    title = song_array[0]
    artist = song_array[1]
    album = song_array[2]
    seed = song_array[3]
    group_seed = song_array[4]

    song = Song.new(title, artist, album, group_seed, seed)

    songs << song
end
