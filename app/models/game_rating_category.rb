class GameRatingCategory < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  #has_many :game_rating_combos
  #has_many :game_ratings, through: :game_rating_combos
end
