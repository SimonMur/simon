module ApplicationHelper
	def meta_description(description_text)
  content_for(:meta_description) { description_text }
end
end
