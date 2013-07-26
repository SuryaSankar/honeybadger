class Examquestion < ActiveRecord::Base
	belongs_to :qpaper
	belongs_to :question
end
