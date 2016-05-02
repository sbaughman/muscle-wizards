class ChangeTypeToActivityInCardio < ActiveRecord::Migration[5.0]
  def change
    rename_column :cardios, :type, :activity
  end
end
