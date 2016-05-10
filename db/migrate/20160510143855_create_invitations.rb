class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.references :prep, foreign_key: true
      t.references :user, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
