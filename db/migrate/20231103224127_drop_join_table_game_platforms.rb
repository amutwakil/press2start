class DropJoinTableGamePlatforms < ActiveRecord::Migration[7.0]
  def change
    drop_table :game_platforms
  end
end
