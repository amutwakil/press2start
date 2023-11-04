class Game < ApplicationRecord
  validates_uniqueness_of :title, case_sensitive: false
  validates_presence_of :title, :year, :review

  belongs_to :genre
  belongs_to :publisher
  belongs_to :developer
  belongs_to :platform

  #has_many :game_ratings
end
