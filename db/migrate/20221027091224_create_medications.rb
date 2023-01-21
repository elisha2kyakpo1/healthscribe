class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.time :time
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
