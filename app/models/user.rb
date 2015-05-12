class User < ActiveRecord::Base
	has_secure_password
	has_and_belongs_to_many :businesses
	has_and_belongs_to_many :markets

	validates :first_name, presence: true
	validates :last_name, presence: true	
	validates :email, presence: true
	validates :email, uniqueness: true
	validates :password, presence: true, length: { minimum: 8 }
	validates :password_confirmation, presence: true
	validates :password_confirmation, confirmation: true

end