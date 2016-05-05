class AddUserToPreps < ActiveRecord::Migration[5.0]
  def change
    add_reference :preps, :user, foreign_key: true
  end
end
