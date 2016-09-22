class Post < ActiveRecord::Base
	attr_accessor :picture
	default_scope -> { order(created_at: :desc) }
	mount_uploader :picture, PictureUploader

	acts_as_taggable_on :tags
end
