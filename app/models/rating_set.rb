class RatingSet < ApplicationRecord
  belongs_to :game
  belongs_to :endgame_appeal_rating
  belongs_to :fun_factor_rating
  belongs_to :replayability_rating
end
