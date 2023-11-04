class AddUniqueToGamePlatforms < ActiveRecord::Migration[7.0]
  def change
    add_index :game_platforms, [:game_id, :platform_id], unique: true
  end
end
