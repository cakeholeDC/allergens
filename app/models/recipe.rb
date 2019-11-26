class Recipe < ApplicationRecord
	belongs_to :user
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	accepts_nested_attributes_for :user


	def user_name=(name)
		self.user = User.find_or_create_by(name: name)
	end

	def user_name
		self.user ? self.user.name : nil
	end
end
