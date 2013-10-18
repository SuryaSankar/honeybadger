module ApplicationHelper

	def render_markdown(text)
		renderer=Redcarpet::Render::HTML.new(prettify: true, filter_html: true)
		extensions={ tables: true , autolink: true, no_intra_emphasis: true , underline: true, quote: true,  strikethrough: true}
		Redcarpet::Markdown.new(renderer , extensions).render text	
	end
end
