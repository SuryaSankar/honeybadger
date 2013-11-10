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

	def cache_programs_courses
		count          = Program.count + University.count + ProgramUniversityCourse.count + Question.count
		max_updated_at = [Program.maximum(:updated_at).try(:utc), University.maximum(:updated_at).try(:utc), Question.maximum(:updated_at).try(:utc),  ProgramUniversityCourse.maximum(:updated_at).try(:utc)].max.try(:to_s, :number)
		"programsuniversities_courses_questions/all-#{count}-#{max_updated_at}"
	end
end
