class QpaperFile < ActiveRecord::Base
	has_attached_file :uploaded_file
	validates_attachment_presence :uploaded_file
end
