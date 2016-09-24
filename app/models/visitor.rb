class Visitor < ApplicationRecord
  attr_accessor :name, :email, :post
  belongs_to :post
end
