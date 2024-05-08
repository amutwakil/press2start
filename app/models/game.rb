class Game < ApplicationRecord

  before_save :generate_slug #1

  #validations
  validates_uniqueness_of :title, case_sensitive: false
  validates_presence_of :title, :summary, :year, :review
  # validates_numericality_of :year
  # validates_length_of :year, is: 4

  #associations
  belongs_to :genre
  belongs_to :publisher
  belongs_to :developer
  belongs_to :platform
  #WIP 🚧🤔💭
  belongs_to :series, optional: true

  #active storage
  # #WIP 🚧🤔💭
  has_many_attached :screenshots
  has_one_attached :cover_art

  def to_param
    slug
  end

  private
  def generate_slug #2
    self.slug = title.parameterize
  end

end
