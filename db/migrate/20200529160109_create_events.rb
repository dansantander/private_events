class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title, null: false, default: '' 
      t.string :event_date, null: false, default: ''
      t.references :user, foreign_key: true, null: true

      t.timestamps
    end
  end
end
