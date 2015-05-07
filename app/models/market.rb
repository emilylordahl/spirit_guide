class Market < ActiveRecord::Base
	has_and_belongs_to_many :users

	def index
		@markets = Market.all
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
