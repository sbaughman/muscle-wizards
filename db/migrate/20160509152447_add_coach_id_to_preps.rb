class AddCoachIdToPreps < ActiveRecord::Migration[5.0]
  def change
    add_column :preps, :coach_id, :integer
  end
end
