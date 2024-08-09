class AddBackendNameToTables < ActiveRecord::Migration[7.0]
  def change
    add_column :platforms, :backend_name, :string
    add_column :developers, :backend_name, :string
    add_column :publishers, :backend_name, :string
    rename_column :platforms, :name, :display_name
    rename_column :developers, :name, :display_name
    rename_column :publishers, :name, :display_name
    add_index :platforms, :backend_name, unique: true 
    add_index :developers, :backend_name, unique: true
    add_index :publishers, :backend_name, unique: true
  end
end
