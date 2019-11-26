class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :update, :edit, :destroy]

	def index
		@recipes = Recipe.all
	end


	def new
		@recipe = Recipe.new
	end

	def create
		# byebug
		
		user = User.find_or_create_by(name: strong_params[:user_name])
		recipe = user.recipes.build(recipe_strong_params)
		
		ingredient = recipe.find_ingredient_from_params_array(strong_params[:ingredients])
		# @recipe = ingredient.recipes.build(strong_params)
		recipe.save!

		redirect_to recipe_path(recipe)
	end

	def update

	end


	private

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end

	def strong_params
		# byebug
		params.require(:recipe).permit(:name,:description,:directions, :user_name, :ingredients=>[])
	end

	def recipe_strong_params
		params.require(:recipe).permit(:name,:description,:directions)
	end
end
