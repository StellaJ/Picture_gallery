class Page < ActiveRecord::Base
	belongs_to :category
	has_many :articles

	scope :visibility, -> {where(:visibility => true)}
	scope :notvisibility, -> {where(:visibility => false)}
	scope :sort, -> {order("pages.position ASC")}
	scope :sortnew, -> {order("pages.created_at DESC")}
end
