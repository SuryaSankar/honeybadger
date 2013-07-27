class Examquestion < ActiveRecord::Base
	belongs_to :qpaper
	belongs_to :question
	accepts_nested_attributes_for :question
end
