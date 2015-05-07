class User < ActiveRecord::Base
	has_and_belongs_to_many :businesses
	has_and_belongs_to_many :markets
	
	def index
	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destory
	end
	
end