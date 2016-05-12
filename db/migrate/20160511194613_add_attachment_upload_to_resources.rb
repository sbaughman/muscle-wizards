class AddAttachmentUploadToResources < ActiveRecord::Migration
  def self.up
    change_table :resources do |t|
      t.attachment :upload
    end
  end

  def self.down
    remove_attachment :resources, :upload
  end
end
