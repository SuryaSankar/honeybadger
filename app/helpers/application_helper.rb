module ApplicationHelper

	def render_markdown(text)
		renderer=Redcarpet::Render::HTML.new(prettify: true, hard_wrap: true)
		extensions={ tables: true , footnotes: true, autolink: true, no_intra_emphasis: true , underline: true, quote: true}
		Redcarpet::Markdown.new(renderer , extensions).render text	
	end
end
