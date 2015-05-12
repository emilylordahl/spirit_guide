class MarketsController < ApplicationController

	before_action :authenticate

	def search
		results = Market.search_borough(params[:term])
		render json: results
	end
	
	def index
		@markets = Market.all
	
		respond_to do |format|
			format.html {}
			format.json { render json: @markets }
		end
	end

	def show
		@market = Market.find(params[:id])

		respond_to do |format|
			format.html {}
			format.json { render json: @markets }
		end
	end

	# def new
	# 	@market = Market.new
	# end

	def create
		@market = Market.new(market_params)
		@market.save

		respond_to do |format|
			format.html { redirect_to @market }
			format.json { render json: @market }
		end
	end

	# def edit
	# 	@market = Market.find(params[:id])
	# end

	# def update
	# end

	# def destory
	# end

	def add_user
		market = Market.find(params[:id])
		user = User.find(params[:user_id])

		market.add_user(user)

		respond_to do |format|
			format.html { redirect_to user_path(user) }
			format.json { render json: @user }
		end
	end

	def remove_user
		market = Market.find(params[:id])
		user = User.find(params[:user_id])

		market.remove_user(user)

		respond_to do |format|
			format.html { redirect_to user_path(user) }
			format.json { render json: @user }
	end

	# private
	# def market_params
	# 	params.require(:market).permit(:name,:borough,:days_open,:hours,:address)
	# end

end