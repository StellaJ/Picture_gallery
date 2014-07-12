class Article < ActiveRecord::Base
	belongs_to :page

  validates :name, presence: true, length: {minimum: 120, allow_blank: true}

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
	scope :sort, -> {order("articles.position ASC")}
	scope :sortnew, -> {order("articles.created_at DESC")}


end
