class CreateLeagues < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.timestamps
    end
    add_reference :teams, :league, foreign_key: true
  end
end
