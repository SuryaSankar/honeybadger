class Textbook < ActiveRecord::Base
  belongs_to :university_course, touch: true
end
