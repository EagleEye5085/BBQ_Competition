class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :members
      t.integer :wins
      t.boolean :last_year_winner

      t.timestamps
    end
  end
end
