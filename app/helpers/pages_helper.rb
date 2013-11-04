module PagesHelper
  def cache_programs_courses
    count          = Program.count + University.count + ProgramUniversityCourse.count
    max_updated_at = [Program.maximum(:updated_at).try(:utc), University.maximum(:updated_at).try(:utc), ProgramUniversityCourse.maximum(:updated_at).try(:utc)].max.try(:to_s, :number)
   "programsuniversitiescourses/all-#{count}-#{max_updated_at}"
  end
end
