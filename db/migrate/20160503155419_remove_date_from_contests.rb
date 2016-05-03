class RemoveDateFromContests < ActiveRecord::Migration[5.0]
  def change
    remove_column :contests, :date
  end
end
