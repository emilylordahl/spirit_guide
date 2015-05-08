class MarketsController < ApplicationController

	# before_action :authenticate

	def index
		@markets = Market.all
	end

	def show
		@market = Market.find(params[:id])
	end

	def create
		@market = Market.new(market_params)
		@market.save
		redirect_to @market
	end

	def update
	end

	def destory
	end

	private
	def market_params
		params.require(:market).permit(:name,:borough,:days_open,:hours,:address)
	end
end