class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :year
      t.text :review
      t.references :genre, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.references :developer, null: false, foreign_key: true
      #wallahilazeem

      t.timestamps
    end
  end
end
