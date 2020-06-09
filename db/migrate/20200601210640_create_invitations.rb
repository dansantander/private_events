class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.integer :invitee_id, null: false, unique: true
      t.integer :attended_event_id,  null: false
      t.boolean :confirmation, null: false, default: 0

      t.timestamps
    end
  end
end
