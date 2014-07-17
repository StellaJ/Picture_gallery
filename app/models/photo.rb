class Photo < ActiveRecord::Base
	belongs_to :gallery

	validates :name, presence: true, length: {maximum: 120, allow_blank: true}

	has_attached_file :photo, 
                      :styles => { :medium => "600x600>", :thumb => "200x200>" }

    validates_attachment_content_type :photo, 
                                      :content_type => /^image\/(png|gif|jpeg)/,
                                      :message => '--- accept only PNG GIF and JPG ---'
                                      
    validates_attachment_size :photo,
                              :in => 0..850.kilobytes,
                              :message => '--- file is to big, max size 850 kilobytes ---'

	scope :visibility, -> {where(:visibility => true)}
	scope :notvisibility, -> {where(:visibility => false)}
	scope :sort, -> {order("photos.position ASC")}
	scope :sortnew, -> {order("photos.created_at DESC")}
	
end
