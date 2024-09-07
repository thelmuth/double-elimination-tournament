require_relative 'song'

class Game

    attr_accessor :bracket, :game_tag, :opponent1, :opponent2, :child_left, :child_right, :parent

    def initialize(bracket, game_tag, opp1, opp2)
        @bracket = bracket
        @game_tag = game_tag
        @opponent1 = opp1
        @opponent2 = opp2
    end

    def to_s
        "#{@bracket}#{@game_tag}. #{@opponent1} vs #{@opponent2}"
    end

    def inspect
        "#{@game_tag}"
    end

end




# NUM_PLAYERS = 94
# # NUM_PLAYERS = 27

# curr_players = 2
# game_index = 1

# g = Game.new(game_index, 1, 2)

# game_queue = [g]
# all_games = [g]


# while curr_players < NUM_PLAYERS

#     game_queue.size.times do |_|
#         g = game_queue.pop

#         game_index += 1
#         left_opp = g.opponent1
#         left_opp_opp = (curr_players * 2) + 1 - left_opp
#         if left_opp_opp > NUM_PLAYERS
#             left_opp_opp = "BYE"
#         end
#         left_game = Game.new(game_index, left_opp, left_opp_opp)

#         game_index += 1
#         right_opp = g.opponent2
#         right_opp_opp = (curr_players * 2) + 1 - right_opp
#         if right_opp_opp > NUM_PLAYERS
#             right_opp_opp = "BYE"
#         end
#         right_game = Game.new(game_index, right_opp_opp, right_opp)

#         game_queue.prepend left_game
#         game_queue.prepend right_game
#         all_games.prepend left_game
#         all_games.prepend right_game

#     end

#     curr_players *= 2

# end

# all_games.each do |game|
#     puts game
# end

# ## NEED to erase all internal games' opponents, and replace leaf opponents with actual players
