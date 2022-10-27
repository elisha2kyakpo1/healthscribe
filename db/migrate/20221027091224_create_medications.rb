class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.text :comment
      t.time :time
      t.datetime :date
      t.references :symptom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
