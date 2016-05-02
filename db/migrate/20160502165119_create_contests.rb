class CreateContests < ActiveRecord::Migration[5.0]
  def change
    create_table :contests do |t|
      t.string :title
      t.string :date
      t.references :prep, foreign_key: true

      t.timestamps
    end
  end
end
