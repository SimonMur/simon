module ApplicationHelper
	def meta_description(post_body)
  content_for(:meta_description) { post_body }
end
end
