class AddUserIdToCertifications < ActiveRecord::Migration[5.0]
  def change
    add_reference :certifications, :user, foreign_key: true
  end
end
