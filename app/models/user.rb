class User < ActiveRecord::Base
	has_secure_password

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :user, presence: true, length: {:within => 4..25}, uniqueness: true
	validates :email, presence: true, length: {maximum: 100}, format: {:with => EMAIL_REGEX, :message => "Invalid format"}, 
		       confirmation: true

	scope :sort, -> {order("last_name ASC, first_name ASC")}
	
end
