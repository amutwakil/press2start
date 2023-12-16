class Game < ApplicationRecord

  before_save :generate_slug

  validates_uniqueness_of :title, case_sensitive: false
  validates_presence_of :title, :year, :review

  belongs_to :genre
  belongs_to :publisher
  belongs_to :developer
  belongs_to :platform
  belongs_to :series, optional: true

  has_many_attached :screenshots
  has_many :game_ratings

  def to_param
    slug
  end

  private
  def generate_slug
    self.slug = title.parameterize
  end
end
