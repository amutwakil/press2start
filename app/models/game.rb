class Game < ApplicationRecord
  belongs_to :genre
  belongs_to :publisher
  belongs_to :developer
end
