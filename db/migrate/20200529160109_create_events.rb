class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title, null: false, default: ''
      t.date :event_date, null: false, default: ''
      t.integer :creator_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
