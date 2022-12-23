class CreateSymptoms < ActiveRecord::Migration[7.0]
  def change
    create_table :symptoms do |t|
      t.integer :stomach_ache, default: 0
      t.integer :diarrhea, default: 0
      t.integer :cosntipation, default: 0
      t.integer :headache, default: 0
      t.integer :nausea, default: 0
      t.integer :fever, default: 0
      t.integer :vomiting, default: 0
      t.time :time
      t.date :date
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
