class CreateMoods < ActiveRecord::Migration[7.0]
  def change
    create_table :moods do |t|
      t.integer :mood, default: 0
      t.text :comment
      t.time :time
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
