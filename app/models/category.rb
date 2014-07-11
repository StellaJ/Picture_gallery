class Category < ActiveRecord::Base
	has_many :pages

	scope :visibility, -> {where(:visibility => true)}
	scope :notvisibility, -> {where(:visibility => false)}
	scope :sort, -> {order("categories.position ASC")}
	scope :sortnew, -> {order("categories.created_at DESC")}
end
