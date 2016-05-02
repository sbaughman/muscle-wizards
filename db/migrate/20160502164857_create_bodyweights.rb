class CreateBodyweights < ActiveRecord::Migration[5.0]
  def change
    create_table :bodyweights do |t|
      t.integer :weight
      t.references :prep, foreign_key: true

      t.timestamps
    end
  end
end
