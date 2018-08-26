class AddImportedToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :imported, :boolean, null: false, default: false
  end
end
