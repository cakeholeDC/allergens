class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :update, :edit, :destroy]

	def index
		@recipes = Recipe.all
	end
end
