class RatingSet < ApplicationRecord
  belongs_to :game
  belongs_to :endgame_appeal_rating
  belongs_to :fun_factor_rating
  belongs_to :replayability_rating
  #🧪🥼🔬 COOK 🔥🔥🔥
  #create a rating set for each existing game
  #then 'find the funnest games' (practicing queries)
end
