class AddReadToResourceries < ActiveRecord::Migration[5.0]
  def change
    add_column :resourceries, :read, :boolean, default: false
  end
end
