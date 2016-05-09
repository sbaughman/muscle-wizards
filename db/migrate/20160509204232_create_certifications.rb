class CreateCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :certifications do |t|
      t.string :name
      t.datetime :date_granted

      t.timestamps
    end
  end
end
