class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :age
      t.string :level
      t.string :gender

      t.timestamps null: false
    end
  end
end
