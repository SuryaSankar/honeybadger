class Examquestion < ActiveRecord::Base
	belongs_to :qpaper, touch: true
	belongs_to :question, touch: true
	belongs_to :user
	accepts_nested_attributes_for :question, reject_if: proc { |attributes| attributes['qtext'].blank?  }
end
