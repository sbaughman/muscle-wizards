class AddUsersToPhilosophies < ActiveRecord::Migration[5.0]
  def change
    add_reference :philosophies, :user, foreign_key: true
  end
end
