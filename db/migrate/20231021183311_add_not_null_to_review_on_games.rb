class AddNotNullToReviewOnGames < ActiveRecord::Migration[7.0]
  def change
    change_column_null :games, :review, false
  end
end
