class AddAttachmentDocumentToMenus < ActiveRecord::Migration
  def self.up
    change_table :menus do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :menus, :document
  end
end
