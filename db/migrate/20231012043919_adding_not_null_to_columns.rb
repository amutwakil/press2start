class AddingNotNullToColumns < ActiveRecord::Migration[7.0]
  def change
    change_column_null :developers, :name, false
    change_column_null :games, :title, false
    change_column_null :genres, :name, false
    change_column_null :platforms, :name, false
    change_column_null :publishers, :name, false
  end
end
