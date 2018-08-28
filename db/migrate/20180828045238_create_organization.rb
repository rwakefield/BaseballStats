class CreateOrganization < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.integer :team_id
      t.integer :league_id
      t.string :level
      t.timestamps
    end

    add_index :organizations, [:team_id, :league_id]
  end
end
