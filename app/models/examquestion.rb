class Examquestion < ActiveRecord::Base
	belongs_to :qpaper
	belongs_to :question
	belongs_to :user
	accepts_nested_attributes_for :question, reject_if: proc { |attributes| attributes['qtext'].blank?  }
end
