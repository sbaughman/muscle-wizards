class CreatePhilosophies < ActiveRecord::Migration[5.0]
  def change
    create_table :philosophies do |t|
      t.text :words

      t.timestamps
    end
  end
end
