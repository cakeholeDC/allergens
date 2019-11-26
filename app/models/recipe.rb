class Recipe < ApplicationRecord
	belongs_to :user
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	accepts_nested_attributes_for :user
	# accepts_nested_attributes_for :ingredient


	def user_name=(name)
		self.user = User.find_or_create_by(name: name)
	end

	def user_name
		self.user ? self.user.name : nil
	end

	# def ingredient=(ingredient)
	# 	self.ingredients << Ingredient.find_or_create_by(name: ingredient)
	# end

	# def ingredient
	# 	self.ingredients ? self.ingredients.each { |ingredient| ingredient.name } : nil
	# end

	def find_ingredient_from_params_array(data)
		data.each do |id|
			ingredient = Ingredient.find(id)
			self.ingredients << ingredient
		end
	end
end

# Ingredients"=>{"Mangosteens"=>["Mangosteens"], "English Spinach"=>["English Spinach"], "Margarine"=>["Margarine"]}}