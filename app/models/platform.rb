class Platform < ApplicationRecord
  before_validation :scrub_input

  validates_presence_of :name
  validate :check_uniqueness
  has_many :games

  private
  def scrub_input
    self.name = name.strip.downcase
  end

  #🤩🤩🤩🌃🌃🌃🌃🌠🌠🌠
  def check_uniqueness
    if Platform.find_by(name: self.name)
      self.errors.delete(:platform)
      self.errors.add(:base, "already exists. Select it in the dropdown")
    end
  end

end
