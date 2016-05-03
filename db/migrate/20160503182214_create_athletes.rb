class CreateAthletes < ActiveRecord::Migration[5.0]
  def change
    create_table :athletes do |t|

      t.timestamps
    end
  end
end
