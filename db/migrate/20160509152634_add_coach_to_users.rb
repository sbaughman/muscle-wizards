class AddCoachToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :coach, :boolean
  end
end
