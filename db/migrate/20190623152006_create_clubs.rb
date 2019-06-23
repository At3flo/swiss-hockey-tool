class CreateClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|
      t.string :name
      t.text :field_address
      t.text :hall_address

      t.timestamps null: false
    end
  end
end
