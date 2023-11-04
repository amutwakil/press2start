class Genre < ApplicationRecord
  validates_uniqueness_of :name, case_sensitive: false
  validates_presence_of :name

  has_many :games
end
