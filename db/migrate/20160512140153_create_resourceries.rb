class CreateResourceries < ActiveRecord::Migration[5.0]
  def change
    create_table :resourceries do |t|
      t.references :prep, foreign_key: true
      t.references :resource, foreign_key: true

      t.timestamps
    end
  end
end
