class AddUniqueIndexToColumns < ActiveRecord::Migration[7.0]
  def change
    add_index :developers, :name, unique: true
    add_index :genres, :name, unique: true
    add_index :platforms, :name, unique: true
    add_index :publishers, :name, unique: true
  end
end
