class Post < ActiveRecord::Base
	acts_as_disqusable
	 has_many :comments
	 has_many :visitors
	attr_accessor :picture
	default_scope -> { order(created_at: :desc) }
	mount_uploader :picture, PictureUploader
	acts_as_taggable_on :tags
	
	extend FriendlyId
    friendly_id :title, use: :slugged
	DISQUS_SHORTNAME = Rails.env == "development" ? "dev_shortname".freeze : "production_shortname".freeze 
end
