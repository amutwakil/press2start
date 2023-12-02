class GameRating < ApplicationRecord
  belongs_to :game_rating_combo
  belongs_to :game
end
