class AddPlatformFKeyToGames < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :games, :platform, null: false, foreign_key: true
  end
end
