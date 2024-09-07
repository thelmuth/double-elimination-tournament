require_relative 'game'


## TODO:
## - erase all internal games' opponents, and replace leaf opponents with actual players
## - loser's bracket

class Tournament
    attr_accessor :num_players, :game_queue, :all_games, :root

    def initialize(num_players)
        @num_players = num_players
        setup_games
    end

    def setup_games

        curr_players = 2
        game_index = 1

        @root = Game.new("w", game_index, 1, 2)

        @game_queue = [@root]
        @all_games = [@root]


        while curr_players < num_players

            @game_queue.size.times do |_|
                g = @game_queue.pop

                game_index += 1
                left_opp = g.opponent1
                left_opp_opp = (curr_players * 2) + 1 - left_opp
                if left_opp_opp > num_players
                    left_opp_opp = "BYE"
                end
                left_game = Game.new("w", game_index, left_opp, left_opp_opp)

                game_index += 1
                right_opp = g.opponent2
                right_opp_opp = (curr_players * 2) + 1 - right_opp
                if right_opp_opp > num_players
                    right_opp_opp = "BYE"
                end
                right_game = Game.new("w", game_index, right_opp_opp, right_opp)

                @game_queue.prepend left_game
                @game_queue.prepend right_game
                @all_games.prepend left_game
                @all_games.prepend right_game

            end

            curr_players *= 2

        end
    end

    def to_s
        s = ""
        @all_games.each do |game|
            s += game.to_s + "\n"
        end
        return s
    end
end

np = 757

tourney = Tournament.new(np)
puts tourney


### To write and recover tournament:
# tourney_file = "tourney_file.bin"
# marshalled = Marshal.dump(tourney)
# File.open(tourney_file, 'w') {|file| file.write(marshalled) }
# recovered = Marshal.load(File.read(tourney_file))
# puts recovered
