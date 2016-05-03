class CreateTargetCardios < ActiveRecord::Migration[5.0]
  def change
    create_table :target_cardios do |t|
      t.integer :duration
      t.string :activity
      t.string :style
      t.references :prep, foreign_key: true

      t.timestamps
    end
  end
end
