class Category < ActiveRecord::Base
	has_many :pages

	validates :name, presence: true, length: {maximum: 50, allow_blank: true}

	scope :visibility, -> {where(:visibility => true)}
	scope :notvisibility, -> {where(:visibility => false)}
	scope :sort, -> {order("categories.position ASC")}
	scope :sortnew, -> {order("categories.created_at DESC")}
end
