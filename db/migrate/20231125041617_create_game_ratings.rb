class CreateGameRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :game_ratings do |t|
      t.references :game_rating_combo, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
