class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :date
      t.time :start_time
      t.integer :places_left
      t.text :location
      t.text :contact
      t.boolean :is_tournament_open
      t.boolean :is_outdoor
      t.text :other_informations
      t.references :club, foreign_key: true
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps null: false
    end
  end
end
