module ApplicationHelper
	def meta_description(post_text)
  content_for(:meta_description) { post_text }
end
end
