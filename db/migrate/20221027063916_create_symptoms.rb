class CreateSymptoms < ActiveRecord::Migration[7.0]
  def change
    create_table :symptoms do |t|
      t.integer :headache, in: 0..5, default: 0
      t.integer :fever, in: 0..5, default: 0
      t.integer :vomiting, in: 0..5, default: 0
      t.integer :stomach_ache, in: 0..5, default: 0
      t.integer :diarrhea, in: 0..5, default: 0
      t.integer :constipation, in: 0..5, default: 0
      t.integer :nausea, in: 0..5, default: 0
      t.time :time
      t.date :date
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
