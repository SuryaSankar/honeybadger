module ApplicationHelper

	def render_markdown(text)
		renderer=Redcarpet::Render::HTML.new(prettify: true, filter_html: true)
		extensions={ tables: true , autolink: true, no_intra_emphasis: true , underline: true, quote: true,  strikethrough: true, fenced_code_blocks: true }
		Redcarpet::Markdown.new(renderer , extensions).render text	
	end

	def render_markdown_with_html(text)
		renderer=Redcarpet::Render::HTML.new(prettify: true )
		extensions={ tables: true , autolink: true, no_intra_emphasis: true , underline: true, quote: true,  strikethrough: true, fenced_code_blocks: true }
		Redcarpet::Markdown.new(renderer , extensions).render text	
	end

	def roman_numeral(n)
		romans=["i","ii","iii","iv","v","vi","vii","viii","ix","x","xi","xii","xiii","xiv","xv","xvi","xvii","xviii","xix","xx"]
		n<=20 ? romans[n-1] : n.to_s
	end

  def roman_to_i(r)
		romans=["i","ii","iii","iv","v","vi","vii","viii","ix","x","xi","xii","xiii","xiv","xv","xvi","xvii","xviii","xix","xx"]
    r=r.downcase
    romans.index(r)+1
  end    

	def cache_programs_courses
		max_updated_at = [Program.maximum(:updated_at).try(:utc), University.maximum(:updated_at).try(:utc), Question.maximum(:updated_at).try(:utc),  ProgramUniversityCourse.maximum(:updated_at).try(:utc)].max.try(:to_s, :number)
		"programsuniversities_courses_questions-#{max_updated_at}"
	end

	def cache_programs_courses_html
		max_updated_at = [Program.maximum(:updated_at).try(:utc), University.maximum(:updated_at).try(:utc), Qpaper.maximum(:updated_at).try(:utc),  ProgramUniversityCourse.maximum(:updated_at).try(:utc)].max.try(:to_s, :number)
		"programsuniversities_courses_qpapers_html-#{max_updated_at}"
	end

	def qpaper_questions(qpaper)
		max_updated_at = [qpaper.updated_at.try(:utc),  Question.where(id: Examquestion.select(:question_id).where(qpaper_id: qpaper.id)).maximum(:updated_at) ].max.try(:to_s, :number)
		"qpaper_questions-#{max_updated_at}"
	end



end
