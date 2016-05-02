class CreateMacros < ActiveRecord::Migration[5.0]
  def change
    create_table :macros do |t|
      t.integer :protein
      t.integer :carbs
      t.integer :fat
      t.integer :fiber
      t.references :prep, foreign_key: true

      t.timestamps
    end
  end
end
