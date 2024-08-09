class Developer < ApplicationRecord
  before_validation :scrub_input
  before_save :store_backend_name

  validates_presence_of :display_name
  validate :check_uniqueness

  has_many :games
end

