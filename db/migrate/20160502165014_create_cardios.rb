class CreateCardios < ActiveRecord::Migration[5.0]
  def change
    create_table :cardios do |t|
      t.integer :duration
      t.string :type
      t.string :style
      t.references :prep, foreign_key: true

      t.timestamps
    end
  end
end
