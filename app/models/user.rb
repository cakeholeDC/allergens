class User < ApplicationRecord
	has_many :allergies
	has_many :ingredients, through: :allergies
	has_many :recipes

end
