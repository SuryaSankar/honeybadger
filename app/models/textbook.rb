class Textbook < ActiveRecord::Base
  belongs_to :university_course, touch: true

  def self.createBook(university, university_course_code, book_name, banner)
    Textbook.create name: book_name, university_course_id: UniversityCourse.find_by(university_id: University.find_by_name(university).id, course_code: university_course_code).id, flipkart_banner: banner
  end
end
