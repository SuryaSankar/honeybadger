class Textbook < ActiveRecord::Base
  belongs_to :university_course, touch: true
  has_many :text_book_sale_offers
  validates_uniqueness_of :name, scope: [:university_course_id]
  def self.createBook(university, university_course_code, book_name, banner)
    Textbook.create name: book_name, university_course_id: UniversityCourse.find_by(university_id: University.find_by_name(university).id, course_code: university_course_code).id, flipkart_banner: banner
  end
end
