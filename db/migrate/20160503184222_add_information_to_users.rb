class AddInformationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :age, :integer
    add_column :users, :bio, :text
    add_column :users, :height, :integer
    add_column :users, :phone_number, :integer
  end
end
