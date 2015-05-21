class BusinessesController < ApplicationController

	before_action :authenticate

	def search
		results = Business.search(params[:borough], params[:term])
		render json: results
	end

	def biz_search
		results = Business.biz_search(@business.yelp_id)
		render json: results
	end
	
	def index
		@businesses = Business.all

		respond_to do |format|
			format.html {}
			format.json { render json: @businesses }
		end
	end

	def show
		@business = Business.find(params[:id])

		respond_to do |format|
			format.html {}
			format.json { render json: @business }
		end
	end

	def new
		@business = Business.new
	end

	def create
		
		@business = Business.find_by(business_params)
		
		if @business.nil?
			@business = Business.create(business_params)
		end

		if current_user
			current_user.add_business(@business)		
		end

		respond_to do |format|
			format.html { redirect_to @business }
			format.json { render json: @business }
		end
	end

	# def edit
	# 	@business = Business.find(params[:id])
	# end

	# def update
	# end

	# def destory
	# end

	private
	def business_params
		params.require(:business).permit(:yelp_id)
	end

end