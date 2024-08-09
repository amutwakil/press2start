class CreateReplayabilityRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :replayability_ratings do |t|
      t.string :option, null: false

      t.timestamps
    end
  end
end
