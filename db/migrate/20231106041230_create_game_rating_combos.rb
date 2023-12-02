class CreateGameRatingCombos < ActiveRecord::Migration[7.0]
  def change
    create_table :game_rating_combos do |t|
      t.string :value, null: false
      t.references :game_rating_category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :game_rating_combos, :value, unique: true
  end
end
