class AddIndexToGamesOnTitle < ActiveRecord::Migration[7.0]
  def change
    add_index :games, :title, unique:true
  end
end
