class IngredientsController < ApplicationController
	before_action :find_ingredient, only: [:show, :update, :edit, :destroy]

	def index
		@ingredients = Ingredient.all
	end

	def new
		@ingredient = Ingredient.new
	end

	def create
		ingredient = Ingredient.create(strong_params)
		redirect_to ingredient_path(ingredient)
	end

	def update
		@ingredient.update(strong_params)
		redirect_to ingredient_path(@ingredient)
	end

	def destroy
		@ingredient.destroy
		redirect_to ingredients_path
	end

	private

		def strong_params
			params.require(:ingredient).permit(:name)
		end

		def find_ingredient
			@ingredient = Ingredient.find(params[:id])
		end
end
