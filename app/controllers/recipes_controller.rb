class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :update, :edit, :destroy]

	def index
		@recipes = Recipe.all
	end


	def new
		@recipe = Recipe.new
	end

	def create
		user = User.find_or_create_by(name: strong_params[:user_name])

		@recipe = user.recipes.build(strong_params)

		@recipe.save!

		redirect_to recipe_path(@recipe)
	end

	def update

	end


	private

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end

	def strong_params
		params.require(:recipe).permit(:name,:description,:directions, :user_name)
	end
end
