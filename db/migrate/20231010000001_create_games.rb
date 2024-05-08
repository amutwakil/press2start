class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.string :summary, null: false
      t.integer :year, null: false
      t.text :review, null: false
      t.string :slug
      t.references :genre, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.references :developer, null: false, foreign_key: true
      t.references :platform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
