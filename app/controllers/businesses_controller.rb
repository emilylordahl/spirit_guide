class BusinessesController < ApplicationController

	before_action :authenticate

	def search
		results = Business.search(params[:term])
		render json: results
	end
	
	# def index
	# end

	# def create
	# end

	# def update
	# end

	# def destory
	# end
	
end