class Publisher < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false

  has_many :games
end
