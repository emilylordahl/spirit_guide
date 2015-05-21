class UsersController < ApplicationController

	# def index
	# 	render json: User.all
	# end

	def show
		@user = User.find(params[:id])
		@businesses = @user.businesses

		yelp_ids = @businesses.map do |business|
			Business.biz_search(business.yelp_id)
		end

		p yelp_ids
		
		respond_to do |format|
			format.html {}
			format.json { render json: @user }
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			respond_to do |format|
				format.html { redirect_to login_path }
				format.json { render json: @user }
			end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: { error: 'New user not created', status: 400 } }
      end
    end
  end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		@user.update(user_params)

		respond_to do |format|
			format.html { redirect_to user_path(@user.id) }
			format.json { render json: @user }
		end
	end

	def destroy
		@user = User.find(params[:id])

		@user.destroy

		respond_to do |format|
			format.html { redirect_to new_user_path }
			format.json { render json: @user }
		end
	end

	# def add_market
	# 	user = User.find(params[:id])
	# end

	# def remove_market
	# 	user = User.find(params[:id])
	# end

	def add_business
		user = User.find(params[:id])
		business = Business.find(params[:id])

		user.add_business(business)

		respond_to do |format|
			format.html { redirect_to user_path(user) }
			format.json { render json: @user }
		end
	end

	def remove_business
		user = User.find(params[:id])
		business = Business.find(params[:business_id])
		binding.pry

		user.remove_business(business)

		respond_to do |format|
			format.html { redirect_to user_path(user) }
			format.json { render json: @user }
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
	end

end