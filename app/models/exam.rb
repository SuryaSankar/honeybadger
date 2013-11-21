class Exam < ActiveRecord::Base
  belongs_to :university_course, touch: true
end
