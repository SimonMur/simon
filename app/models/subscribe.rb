class Subscribe < ApplicationRecord
	belongs_to :post
	attr_accessor :name, :email
end
