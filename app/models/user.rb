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