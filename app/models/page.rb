class Page < ActiveRecord::Base
	belongs_to :category
	has_many :articles

	validates :name, presence: true, length: {maximum: 50, allow_blank: true}

	scope :visibility, -> {where(:visibility => true)}
	scope :notvisibility, -> {where(:visibility => false)}
	scope :sort, -> {order("pages.position ASC")}
	scope :sortnew, -> {order("pages.created_at DESC")}
end
