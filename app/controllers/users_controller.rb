class UsersController < ApplicationController

	def index
		render json: User.all
	end

	def show
		@user = User.find(params[:id])

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
				format.html { redirect_to users_path }
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
	end

	def update
	end

	def destory
	end

	private
	def user_params
		params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
	end















end