class AddSeriesToGames < ActiveRecord::Migration[7.0]
  def change
    add_reference :games, :series, foreign_key: true
  end
end
