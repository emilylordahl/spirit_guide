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

	def create

		@market = Market.find_by(market_params)

		if @market.nil?
			@market = Market.create(market_params)
		end

		if current_user
			current_user.add_market(@market)
		end

		respond_to do |format|
			format.html { redirect_to @market }
			format.json { render json: @market }
		end
	end

	def destroy
	
		@market = Market.find(params[:id])

		if current_user
			current_user.remove_market(@market)
			render 'users/show'
		end
	end

	private
	def market_params
		params.require(:market).permit(:name,:borough,:days_open,:hours,:address)
	end

end