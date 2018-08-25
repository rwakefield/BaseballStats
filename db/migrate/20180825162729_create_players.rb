class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :birth_year
      t.string :identifier
      t.timestamps
    end
    add_index :players, :identifier, unique: true
  end
end
