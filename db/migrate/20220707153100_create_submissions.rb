class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.string :title
      t.string :meat
      t.string :rub
      t.string :sauce
      t.integer :cook_time
      t.float :score
      t.boolean :spicy

      t.timestamps
    end
  end
end
