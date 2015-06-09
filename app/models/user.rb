class User < ActiveRecord::Base
	
	has_secure_password
	has_and_belongs_to_many :businesses, dependent: :destroy
	has_and_belongs_to_many :markets, dependent: :destroy

	validates :first_name, presence: true
	validates :last_name, presence: true	
	validates :email, presence: true
	validates :email, uniqueness: true
	validates :email, :email => {:strict_mode => true}
	validates :password, presence: true, length: { minimum: 8 }, 
		unless: :skip_password_validation
	validates :password_confirmation, presence: true, 
		unless: :skip_password_confirmation_validation
	validates :password_confirmation, confirmation: true

	attr_accessor :skip_password_validation, :skip_password_confirmation_validation

	def add_market(market)
		self.markets.push(market) unless self.markets.include? market
	end

	def remove_market(market)
		self.markets.destroy(market) if self.markets.include? market
	end

	def add_business(business)
		self.businesses.push(business) unless self.businesses.include? business
	end

	def remove_business(business)
		self.businesses.destroy(business) if self.businesses.include? business
	end

end