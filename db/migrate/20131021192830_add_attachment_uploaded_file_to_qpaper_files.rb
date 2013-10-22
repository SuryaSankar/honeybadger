class AddAttachmentUploadedFileToQpaperFiles < ActiveRecord::Migration
  def self.up
    change_table :qpaper_files do |t|
      t.attachment :uploaded_file
    end
  end

  def self.down
    drop_attached_file :qpaper_files, :uploaded_file
  end
end
