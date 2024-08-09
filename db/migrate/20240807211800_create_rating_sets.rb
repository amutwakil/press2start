class CreateRatingSets < ActiveRecord::Migration[7.0]
  def change
    create_table :rating_sets do |t|
      t.belongs_to :game, null: false, foreign_key: true
      t.timestamps
    end
  end
end

