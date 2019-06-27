class CreateInscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :inscriptions do |t|
      t.string :team_name
      t.references :event, foreign_key: true
      t.references :club, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps null: false
    end
  end
end
