class GameRatingCombo < ApplicationRecord
  validates :value, presence: true, uniqueness: true
  belongs_to :game_rating_category
end
