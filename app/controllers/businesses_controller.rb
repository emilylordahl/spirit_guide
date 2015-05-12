class BusinessesController < ApplicationController

	before_action :authenticate

	def search
		results = Business.search(params[:term])
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
		@business = Business.new(business_params)
		@business.save

		respond_to do |format|
			format.html { redirect_to @business }
			format.json { render json: @business }
		end
	end

	def edit
		@business = Business.find(params[:id])
	end

	def update
	end

	def destory
	end
	
	def add_user
		business = Business.find(params[:id])
		user = User.find(params[:user_id])

		business.add_user(user)

		respond_to do |format|
			format.html { redirect_to user_path(user) }
			format.json { render json: @user }
		end
	end

	def remove_user
		business = Business.find(params[:id])
		user = User.find(params[:user_id])

		business.remove_user(user)

		respond_to do |format|
			format.html { redirect_to user_path(user) }
			format.json { render json: @user }
		end
	end

	private
	def business_params
		params.require(:business).permit(:yelp_id)
	end

end