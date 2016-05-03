class AddDateToContests < ActiveRecord::Migration[5.0]
  def change
    add_column :contests, :date, :datetime
  end
end
