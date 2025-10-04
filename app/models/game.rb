class Game < ApplicationRecord
  before_save :generate_slug

  #validations
  validates_uniqueness_of :title, case_sensitive: false
  validates_presence_of :title, :summary, :year, :review
  validates_presence_of :rating_set
  # validates_numericality_of :year
  # validates_length_of :year, is: 4

  #associations
  belongs_to :genre
  belongs_to :publisher
  belongs_to :developer
  belongs_to :platform
  has_one :rating_set, dependent: :destroy
  #WIP 🚧🤔💭
  belongs_to :series, optional: true

  #active storage
  #WIP 🚧🤔💭
  has_many_attached :screenshots
  has_one_attached :cover_art do |attachable|
    attachable.variant :large, resize_to_fit: [500,500]
    attachable.variant :medium, resize_to_fit: [300,300]
    attachable.variant :small, resize_and_pad: [200, 200, {background: "black"}]
  end

  def to_param
    slug
  end

  accepts_nested_attributes_for :developer, reject_if: :all_blank
  accepts_nested_attributes_for :platform, reject_if: :all_blank
  accepts_nested_attributes_for :publisher, reject_if: :all_blank
  accepts_nested_attributes_for :rating_set

  private
  def generate_slug
    self.slug = title.parameterize
  end

end