class CreateEndgameAppealRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :endgame_appeal_ratings do |t|
      t.string :option, null: false

      t.timestamps
    end
  end
end