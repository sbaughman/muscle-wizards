class AddWebsiteUrlToContests < ActiveRecord::Migration[5.0]
  def change
    add_column :contests, :url, :string
  end
end
