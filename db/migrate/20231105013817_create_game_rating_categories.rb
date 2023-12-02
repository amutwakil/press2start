class CreateGameRatingCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :game_rating_categories do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :game_rating_categories, :name, unique: true
  end
end
