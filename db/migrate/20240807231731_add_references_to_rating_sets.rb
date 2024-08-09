class AddReferencesToRatingSets < ActiveRecord::Migration[7.0]
  def change
    add_reference :rating_sets, :replayability_rating, null: false, foreign_key: true
    add_reference :rating_sets, :fun_factor_rating, null: false, foreign_key: true
    add_reference :rating_sets, :endgame_appeal_rating, null: false, foreign_key: true
  end
end
