class Page < ActiveRecord::Base
	belongs_to :category
	has_many :articles

	validates :name, presence: true, length: {minimum: 50, allow_blank: true}
	validates :position, :visibility presence: true

	scope :visibility, -> {where(:visibility => true)}
	scope :notvisibility, -> {where(:visibility => false)}
	scope :sort, -> {order("pages.position ASC")}
	scope :sortnew, -> {order("pages.created_at DESC")}
end
