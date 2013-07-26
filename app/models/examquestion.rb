class Examquestion < ActiveRecord::Base
	belongs_to :qpaper
	belogs_to :question
end
