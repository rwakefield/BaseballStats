class CreateCareerStats < ActiveRecord::Migration[5.0]
  def change
    create_table :career_stats do |t|
      t.decimal :batting_average, precision: 10, scale: 3
      t.decimal :slugging_percentage, precision: 10, scale: 3
      t.references :player
    end
  end
end
