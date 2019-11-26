class UsersController < ApplicationController
	before_action :find_user, only: [:show, :update, :edit, :destroy]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		user = User.create(strong_params)
		redirect_to user_path(user)
	end

	def update
		@user.update(strong_params)
		redirect_to user_path(@user)
	end

	def destroy
		@user.destroy
		redirect_to users_path
	end

	private

	def strong_params
		params.require(:user).permit(:name)
	end

	def find_user
		@user = User.find(params[:id])
	end

end