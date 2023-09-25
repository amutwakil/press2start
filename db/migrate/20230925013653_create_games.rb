class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :year
      t.text :review

      t.timestamps
    end
  end
end
